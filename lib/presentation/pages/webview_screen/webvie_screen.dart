import 'dart:collection';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get_it/get_it.dart';
import 'package:idwey/presentation/blocs/confirm_reservation_bloc/confirm_reservation_bloc.dart';
import 'package:idwey/theme/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class InAppWebViewScreen extends StatefulWidget {
  final String url;
  final ConfirmReservationState state;

  const InAppWebViewScreen({Key? key, required this.url, required this.state})
      : super(key: key);
  @override
  _InAppWebViewScreenState createState() => _InAppWebViewScreenState();
}

class _InAppWebViewScreenState extends State<InAppWebViewScreen> {
  final GlobalKey webViewKey = GlobalKey();

  InAppWebViewController? webViewController;

  PullToRefreshController? pullToRefreshController;

  late ContextMenu contextMenu;
  double progress = 0;
  final urlController = TextEditingController();

  @override
  void initState() {
    super.initState();

    contextMenu = ContextMenu(
        menuItems: [
          ContextMenuItem(
              title: "Special",
              action: () async {
                print("Menu item Special clicked!");
                print(await webViewController?.getSelectedText());
                await webViewController?.clearFocus();
              })
        ],
        onCreateContextMenu: (hitTestResult) async {
          print("onCreateContextMenu");
          print(hitTestResult.extra);
          print(await webViewController?.getSelectedText());
        },
        onHideContextMenu: () {
          print("onHideContextMenu");
        },
        onContextMenuActionItemClicked: (contextMenuItemClicked) async {
          print("onContextMenuActionItemClicked: " +
              "id.toString()" +
              " " +
              contextMenuItemClicked.title);
        });

    pullToRefreshController = kIsWeb ||
            ![TargetPlatform.iOS, TargetPlatform.android]
                .contains(defaultTargetPlatform)
        ? null
        : PullToRefreshController(
            onRefresh: () async {
              if (defaultTargetPlatform == TargetPlatform.android) {
                webViewController?.reload();
              } else if (defaultTargetPlatform == TargetPlatform.iOS ||
                  defaultTargetPlatform == TargetPlatform.macOS) {
                webViewController?.loadUrl(
                    urlRequest:
                        URLRequest(url: await webViewController?.getUrl()));
              }
            },
          );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        //Navigator.pop(context);
        context.router.popUntilRoot();
        return true;
      },
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey[200],
            elevation: 0,
            actions: [
              Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: materialPrimary.withOpacity(0.8),
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.refresh,
                  ),
                  onPressed: () {
                    webViewController?.reload();
                  },
                ),
              ),
            ],
            leading: Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: materialPrimary.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(50)),
              child: IconButton(
                onPressed: () {
                  //Navigator.pop(context);
                  context.router.popUntilRoot();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ),
            centerTitle: true,
            bottom: const PreferredSize(
                child: Divider(
                  thickness: 1,
                  height: 1,
                ),
                preferredSize: Size.fromHeight(16.0)),
          ),
          body: SafeArea(
              child: Column(children: <Widget>[
            Expanded(
              child: Stack(
                children: [
                  InAppWebView(
                    key: webViewKey,
                    initialUrlRequest: URLRequest(url: Uri.parse(widget.url)),
                    // initialUrlRequest:
                    // URLRequest(url: WebUri(Uri.base.toString().replaceFirst("/#/", "/") + 'page.html')),
                    // initialFile: "assets/index.html",
                    initialUserScripts: UnmodifiableListView<UserScript>([]),
                    contextMenu: contextMenu,
                    pullToRefreshController: pullToRefreshController,
                    onWebViewCreated: (controller) async {
                      webViewController = controller;
                    },
                    onLoadResource: (controller, resource) {
                      print("Started at: " +
                          resource.startTime.toString() +
                          "ms ---> duration: " +
                          resource.duration.toString() +
                          "ms " +
                          resource.url.toString());
                    },
                    onLoadStart: (controller, url) async {
                      setState(() {
                        print("onloadstart $url");
                        print(url.toString());
                        urlController.text = url.toString();
                        print(
                            "${url.toString().contains("http://102.219.178.96:5776/success")}*********");
                        if (url.toString().contains(
                                "http://102.219.178.96:5776/success") ==
                            true) {
                          print("success**********");
                          context
                              .read<ConfirmReservationBloc>()
                              .add(ConfirmReservationEvent.doCheckout({
                                "code": widget.state.code,
                                "customer_id": widget.state.customerID,
                                "first_name": widget.state.name,
                                "last_name": widget.state.lastname,
                                "phone": widget.state.phone,
                                "email": widget.state.email,
                                "city": widget.state.ville,
                                "country": "TN",
                                "customer_notes":
                                    widget.state.specialConditions,
                                "payment_gateway": "konnect_payment",
                                "paymentRef": widget.state.paymentRef,
                              }));
                        }
                      });
                    },
                    shouldOverrideUrlLoading:
                        (controller, navigationAction) async {
                      var uri = navigationAction.request.url!;

                      if (![
                        "http",
                        "https",
                        "file",
                        "chrome",
                        "data",
                        "javascript",
                        "about"
                      ].contains(uri.scheme)) {
                        if (await canLaunchUrl(uri)) {
                          // Launch the App
                          await launchUrl(
                            uri,
                          );
                          // and cancel the request
                          return NavigationActionPolicy.CANCEL;
                        }
                      }

                      return NavigationActionPolicy.ALLOW;
                    },
                    onLoadStop: (controller, url) async {
                      pullToRefreshController?.endRefreshing();
                      setState(() {
                        //  this.url = url.toString();
                        urlController.text = url.toString();
                      });
                    },

                    onProgressChanged: (controller, progress) {
                      if (progress == 100) {
                        pullToRefreshController?.endRefreshing();
                      }
                      setState(() {
                        this.progress = progress / 100;
                        //   urlController.text = url.toString();
                      });
                    },
                    onUpdateVisitedHistory: (controller, url, isReload) {
                      setState(() {
                        // this.url = url.toString();
                        urlController.text = url.toString();
                      });
                    },

                    onConsoleMessage: (controller, consoleMessage) {
                      print("consoleMessage");
                      print(consoleMessage);
                      print(consoleMessage.messageLevel);
                      print(consoleMessage.message);
                    },
                  ),
                  progress < 1.0
                      ? LinearProgressIndicator(value: progress)
                      : Container(),
                ],
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  child: Icon(Icons.arrow_back),
                  onPressed: () {
                    webViewController?.goBack();
                  },
                ),
                ElevatedButton(
                  child: Icon(Icons.arrow_forward),
                  onPressed: () {
                    webViewController?.goForward();
                  },
                ),
              ],
            ),
          ]))),
    );
  }
}
