import 'dart:convert';

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heroicons/heroicons.dart';
import 'package:idwey/components/buttons/button.dart';
// Import for Android features.
import 'package:webview_flutter_android/webview_flutter_android.dart';
// Import for iOS features.
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
import 'package:idwey/constants/enums.dart';
import 'package:idwey/data/models/room_dto.dart';
import 'package:idwey/presentation/blocs/confirm_reservation_bloc/confirm_reservation_bloc.dart';

import 'package:idwey/theme/app_colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'sections/payment_section.dart';
import 'sections/reservation_form.dart';
import 'sections/reservation_section.dart';

@RoutePage()
class ConfirmReservationScreen extends StatefulWidget
    implements AutoRouteWrapper {
  final String? id;
  final String? url;
  final String? address;
  final String? hostName;
  final String? region;
  final String? dateDebut;
  final String? dateFin;
  final String? nuits;
  final String? adultes;
  final String? total;
  final String? price;
  final String code;
  final String customerId;
  final List<Room>? rooms;
  final TypeReservation? typeReservation;
  final int? currencyValue;
  final String? currencyName;
  final String? currency;
  final String? activityDuration;
  const ConfirmReservationScreen(
      {Key? key,
      this.id,
      this.address,
      this.hostName,
      this.region,
      this.dateDebut,
      this.dateFin,
      this.nuits,
      this.adultes,
      this.total,
      this.rooms,
      this.typeReservation,
      this.currencyValue,
      this.currencyName,
      this.currency,
      this.activityDuration,
      this.url,
      required this.code,
      required this.customerId,
      this.price})
      : super(key: key);

  @override
  State<ConfirmReservationScreen> createState() =>
      _ConfirmReservationScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => ConfirmReservationBloc(),
      child: this,
    );
  }
}

class _ConfirmReservationScreenState extends State<ConfirmReservationScreen> {
  TextEditingController controller = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController villeController = TextEditingController();
  TextEditingController paysController = TextEditingController();

  bool isChecked = false;
  bool offline = false;
  bool online = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Dio dio = Dio();
  final KONNECT_API_KEY = "654a56cf228ef6b9d3bcac3b:U4qdkC6tbhtpudrMn";
  final KONNECT_RECEIVER_WALLET_ID = "654a56cf228ef6b9d3bcac3f";
  final KONNECT_PAYMENT_URL =
      "https://api.preprod.konnect.network/api/v2/payments/init-payment";
  void initiatePayment() async {
    Map<String, String> headers = {
      'x-api-key': KONNECT_API_KEY,
    };

    Map<String, dynamic> requestBody = {
      "receiverWalletId": KONNECT_RECEIVER_WALLET_ID,
      "token": "TND",
      "amount": 10000,
      "type": "immediate",
      "description": "payment description",
      "acceptedPaymentMethods": ["wallet", "bank_card", "e-DINAR"],
      "lifespan": 10,
      "checkoutForm": true,
      "addPaymentFeesToAmount": true,
      "firstName": "John",
      "lastName": "Doe",
      "phoneNumber": "22777777",
      "email": "john.doe@gmail.com",
      "orderId": "1234657",
      "webhook": "https://merchant.tech/api/notification_payment",
      "silentWebhook": true,
      "successUrl": "http://102.219.178.96:5776/success",
      "failUrl": "http://102.219.178.96:5776/failed",
      "theme": "light"
    };
    print("requestBody");
    print(requestBody);
    try {
      var response = await dio.post(
        KONNECT_PAYMENT_URL,
        data: jsonEncode(requestBody),
        options: Options(headers: headers),
      );
      print(response.data);
      print(response.statusCode);
      if (response.statusCode == 200) {
        // Process the response here
        // Redirect the user to the payment URL provided in the response
        String paymentUrl = jsonDecode(jsonEncode(response.data))['payUrl'];
        // Redirect the user to paymentUrl
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          InAppWebViewController _webViewController;
          return Scaffold(
            appBar: AppBar(title: const Text('Flutter Simple Example')),
            body: InAppWebView(
              initialUrlRequest: URLRequest(url: Uri.parse(paymentUrl)),
              shouldOverrideUrlLoading: (controller, url) async {
                return NavigationActionPolicy.ALLOW;
              },
              onWebViewCreated: (InAppWebViewController controller) {
                _webViewController = controller;
              },
              onLoadStart: (controller, url) {
                setState(() {
                  print('Page started loading: $url');
                });
              },
              onLoadStop: (controller, url) {
                setState(() {
                  print('Page finished loading: $url');
                });
              },
              initialOptions: InAppWebViewGroupOptions(
                  crossPlatform: InAppWebViewOptions(
                    useShouldInterceptAjaxRequest: true,
                    useShouldInterceptFetchRequest: true,
                    useShouldOverrideUrlLoading: true,
                    javaScriptEnabled: true,
                    cacheEnabled: true,
                    //    clearCache:true,
                  ),
                  ios: IOSInAppWebViewOptions(
                    allowsInlineMediaPlayback: true,
                  ),
                  android: AndroidInAppWebViewOptions(
                    domStorageEnabled: true,
                    useHybridComposition: true,
                    databaseEnabled: true,
                  )),
            ),
          );
        }));
      } else {
        // Handle other status codes (error handling)
      }
    } catch (e) {
      print("error");
      print(e);
      // Handle exceptions
    }
  }

  @override
  void initState() {
    context.read<ConfirmReservationBloc>().initStatus();

    // TODO: implement initState
    context
        .read<ConfirmReservationBloc>()
        .add(const ConfirmReservationEvent.getUser());
    nameController.addListener(() {
      context
          .read<ConfirmReservationBloc>()
          .add(ConfirmReservationEvent.nameChanged(nameController.text));
    });

    emailController.addListener(() {
      context
          .read<ConfirmReservationBloc>()
          .add(ConfirmReservationEvent.emailChanged(emailController.text));
    });

    controller.addListener(() {
      context
          .read<ConfirmReservationBloc>()
          .add(ConfirmReservationEvent.lastnameChanged(controller.text));
    });

    phoneController.addListener(() {
      context
          .read<ConfirmReservationBloc>()
          .add(ConfirmReservationEvent.phoneChanged(phoneController.text));
    });

    villeController.addListener(() {
      context
          .read<ConfirmReservationBloc>()
          .add(ConfirmReservationEvent.villeChanged(villeController.text));
    });

    controller.addListener(() {
      context
          .read<ConfirmReservationBloc>()
          .add(ConfirmReservationEvent.specialConditionsChanges(
            controller.text,
          ));
    });

    context
        .read<ConfirmReservationBloc>()
        .add(ConfirmReservationEvent.setParams(widget.code, ""));
    super.initState();
  }

  void initControllers() {
    setState(() {
      nameController.text =
          context.read<ConfirmReservationBloc>().state.name ?? "";
      emailController.text =
          context.read<ConfirmReservationBloc>().state.email ?? "";
      phoneController.text =
          context.read<ConfirmReservationBloc>().state.phone ?? "";
      controller.text =
          context.read<ConfirmReservationBloc>().state.lastname ?? "";
    });

    print(nameController.text);
    print(emailController.text);
    print(phoneController.text);
    print(controller.text);
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Icon(
                  Icons.check_circle,
                  size: 100,
                  color: primaryOrange,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text('Félicitations pour votre réservation ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "L'équipe Idwey vous contactera bientôt. Consultez votre tableau de bord pour suivre le statut ",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomButton.primary(
                  child: const Text('Ok'),
                  onPressed: () {
                    context.router.popUntilRoot();
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }

  showLoadingDialog() {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ConfirmReservationBloc, ConfirmReservationState>(
      listener: (context, state) {
        if (state.status == StateStatus.success) {
          initControllers();
        }
        if (state.checkoutStatus == StateStatus.loading) {
          showLoadingDialog();
        }
        if (state.checkoutStatus == StateStatus.success) {
          Navigator.pop(context);
          _showDialog(context);
        }
      },
      builder: (context, state) {
        if (state.status == StateStatus.loading) {
          return const Scaffold(
              body: Center(child: CircularProgressIndicator()));
        } else if (state.status == StateStatus.success) {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.grey[200],
                elevation: 0,
                leading: Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: materialPrimary.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(50)),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
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
              bottomNavigationBar: BottomAppBar(
                elevation: 0,
                child: Container(
                  width: double.infinity,
                  padding:
                      EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.h),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 8.h),
                          elevation: 0,
                          primary: primaryOrange,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.r))),
                      onPressed: state.name?.isEmpty == true ||
                              state.lastname?.isEmpty == true ||
                              state.email?.isEmpty == true ||
                              state.phone?.isEmpty == true ||
                              state.ville?.isEmpty == true ||
                              state.termsAndConditions == false ||
                              state.offline == false
                          ? () {
                              initiatePayment();
                            }
                          : () {
                              context.read<ConfirmReservationBloc>().add(
                                  const ConfirmReservationEvent.doCheckout());
                            },
                      child: Text(
                        'Confirmer la réservation',
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      )),
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReservationSection(
                      price: widget.price ?? "",
                      url: widget.url,
                      typeReservation: widget.typeReservation,
                      hostName: widget.hostName ?? "",
                      dateDebut: widget.dateDebut ?? "",
                      dateFin: widget.dateFin ?? '',
                      address: widget.address ?? "",
                      nuits: widget.typeReservation == TypeReservation.event
                          ? null
                          : widget.nuits,
                      adultes: widget.adultes,
                      rooms: widget.rooms,
                      activityDuration: widget.activityDuration,
                      total: " ${widget.total} DT",
                    ),
                    ReservationForm(
                      formKey: _formKey,
                      paysController: paysController,
                      controller: controller,
                      nameController: nameController,
                      emailController: emailController,
                      phoneController: phoneController,
                      messageController: messageController,
                      dateController: dateController,
                      villeController: villeController,
                    ),
                    // const AssuranceSection(),
                    PayementSection(
                      offline: offline,
                      online: online,
                      onOnlineChecked: (String v) {
                        setState(() {
                          online = v == "Online";
                        });
                        context.read<ConfirmReservationBloc>().add(
                            const ConfirmReservationEvent.onOnlinechecked());
                      },
                      onOfflineChecked: (String v) {
                        setState(() {
                          offline = v == 'Offline';
                        });
                        context.read<ConfirmReservationBloc>().add(
                            const ConfirmReservationEvent.onOfflinechecked());
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          checkColor: Colors.white,
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value ?? false;
                            });
                            context.read<ConfirmReservationBloc>().add(
                                ConfirmReservationEvent
                                    .onTermsAndConditionsChecked(value));
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 16.h),
                          child: RichText(
                            text: TextSpan(
                              text: 'J\'ai lu et j\'accepte ',
                              style: TextStyle(
                                fontSize: 13.sp,
                                color: Colors.black,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: ' les Termes et conditions.\n',
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      // final Uri uri = Uri.parse(Urls.TERMS_URL);
                                      // launchUrl(uri);
                                    },
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 13.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.left,
                            textHeightBehavior: const TextHeightBehavior(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ));
        }
        return const SizedBox.shrink();
      },
    );
  }
}
