import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:icofont_flutter/icofont_flutter.dart';

import '../models/host.dart';
import '../services/hostCalls.dart';
import '../utils/colors.dart';
import '../utils/utils.dart';
import '../widgets/common/footer.dart';
import '../widgets/common/scaffold.dart';

class HostDetailsPage extends StatefulWidget {
  int? id;
  HostDetailsPage({Key? key, required this.id}) : super(key: key);

  @override
  State<HostDetailsPage> createState() => _HostDetailsPageState();
}

class _HostDetailsPageState extends State<HostDetailsPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  bool loading = false;
  bool showFAB = false;
  HostDetail hostDetail =
      HostDetail(0, '', '', '', '', [], 0, '', '', 0, '', '', '', [], '', '');
  String currentImage = '';
  callHosts() {
    setState(() {
      loading = true;
    });
    HostCalls.getHostDetails(widget.id).then((host) async {
      setState(() {
        hostDetail = host;
        currentImage = host.gallery_images_url[0].large;
      });
      await Future.delayed(Duration(seconds: 1));
      setState(() {
        loading = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    checkInternetConnectivity(context, callHosts);
  }

  void scrollToTop() {
    scrollController.animateTo(0,
        duration: const Duration(seconds: 2), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: primaryGrey));
    return CommonScaffold(
      showFab: showFAB,
      backtotop: scrollToTop,
      scaffoldKey: _scaffoldKey,
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            loading
                ? Container(
                    height: 300,
                    margin: EdgeInsets.all(30),
                    child: Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(primary),
                      ),
                    ),
                  )
                : Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 230,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: CachedNetworkImage(
                                imageUrl: hostDetail.banner_image_url,
                                fit: BoxFit.cover,
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) => Center(
                                  child: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: CircularProgressIndicator(
                                        value: downloadProgress.progress),
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              padding: EdgeInsets.only(top: 20.0, left: 20.0),
                              child: Text(
                                hostDetail.title,
                                style: TextStyle(
                                    fontSize: 28.0,
                                    fontWeight: FontWeight.w500,
                                    color: titleBlack),
                              )),
                          Container(
                            padding: EdgeInsets.only(left: 20.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.location_pin,
                                  size: 14,
                                  color: materialPrimary.shade100,
                                ),
                                SizedBox(
                                  width: 3.0,
                                ),
                                Text(
                                  hostDetail.address,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: materialPrimary.shade100),
                                ),
                              ],
                            ),
                          ),
                          SectionDivider(),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              children: [
                                hostDetail.type.length != 0
                                    ? DetailIcons(
                                        icon: FontAwesomeIcons.fontAwesome,
                                        type: 'Type',
                                        description: hostDetail.type[0],
                                      )
                                    : Container(),
                                SizedBox(
                                  height: 12,
                                ),
                                DetailIcons(
                                  icon: Icons.group,
                                  type: 'Personnes',
                                  description: hostDetail.max_person.toString(),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                DetailIcons(
                                  icon: FontAwesomeIcons.mapLocationDot,
                                  type: 'Emplacement',
                                  description: hostDetail.location_name,
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                hostDetail.impactsocial != ""
                                    ? DetailIcons(
                                        icon: FontAwesomeIcons.slideshare,
                                        type: 'Impact social',
                                        description: hostDetail.impactsocial,
                                      )
                                    : Container(),
                              ],
                            ),
                          ),
                          SectionDivider(),
                          Column(
                            children: [
                              Container(
                                height: 300,
                                width: double.maxFinite,
                                child: CachedNetworkImage(
                                  imageUrl: currentImage,
                                  fit: BoxFit.cover,
                                  progressIndicatorBuilder:
                                      (context, url, downloadProgress) =>
                                          Center(
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: CircularProgressIndicator(
                                          value: downloadProgress.progress),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              hostDetail.gallery_images_url.length != 0
                                  ? CarouselSlider.builder(
                                      itemCount:
                                          hostDetail.gallery_images_url.length,
                                      options: CarouselOptions(
                                        height: 100,
                                        viewportFraction: 0.3,
                                        enlargeCenterPage: true,
                                        onPageChanged: (index, reason) {
                                          setState(() {
                                            currentImage = hostDetail
                                                .gallery_images_url[index]
                                                .large;
                                          });
                                        },
                                      ),
                                      itemBuilder:
                                          (BuildContext context, int index, _) {
                                        return GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              currentImage = hostDetail
                                                  .gallery_images_url[index]
                                                  .large;
                                            });
                                          },
                                          child: Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 5),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: currentImage ==
                                                        hostDetail
                                                            .gallery_images_url[
                                                                index]
                                                            .large
                                                    ? Colors.blue
                                                    : Colors.transparent,
                                                width: 2,
                                              ),
                                            ),
                                            child: Container(
                                              width: 100,
                                              height: 100,
                                              child: CachedNetworkImage(
                                                imageUrl: hostDetail
                                                    .gallery_images_url[index]
                                                    .thumb,
                                                fit: BoxFit.cover,
                                                progressIndicatorBuilder:
                                                    (context, url,
                                                            downloadProgress) =>
                                                        Center(
                                                  child: SizedBox(
                                                    width: 50,
                                                    height: 50,
                                                    child:
                                                        CircularProgressIndicator(
                                                            value:
                                                                downloadProgress
                                                                    .progress),
                                                  ),
                                                ),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        Icon(Icons.error),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    )
                                  : Container(),
                            ],
                          ),
                          Title(title: 'DESCRIPTION'),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20),
                            child: HtmlWidget(
                              hostDetail.content,
                            ),
                          ),
                          Title(
                            title: 'Règlement'.toUpperCase(),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Entrée',
                                  style: TextStyle(color: grey, fontSize: 18),
                                ),
                                Text(
                                  '${hostDetail.check_in_time} H',
                                  style: TextStyle(color: grey, fontSize: 18),
                                ),
                                Text(
                                  'Sortie',
                                  style: TextStyle(color: grey, fontSize: 18),
                                ),
                                Text(
                                  '${hostDetail.check_out_time} H',
                                  style: TextStyle(color: grey, fontSize: 18),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
            Footer(),
            CreatedBy(),
            BackToTop(scrollToTop),
          ],
        ),
      ),
    );
  }
}

class DetailIcons extends StatelessWidget {
  IconData icon;
  String description;
  String type;
  DetailIcons(
      {Key? key,
      required this.icon,
      required this.description,
      required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 35.0,
          color: titleBlue,
        ),
        SizedBox(
          width: 20.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              type,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            Text(
              description,
              style: TextStyle(fontSize: 14, color: grey),
            )
          ],
        )
      ],
    );
  }
}

class Title extends StatelessWidget {
  String title;
  Title({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 40),
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Container(
                width: 7,
                height: 30,
                color: primaryOrange,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                title,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: titleBlack),
              )
            ],
          ),
        ),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: const Divider(thickness: 1)),
      ],
    );
  }
}

class SectionDivider extends StatelessWidget {
  const SectionDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        margin: EdgeInsets.only(top: 10, bottom: 20),
        child: const Divider(thickness: 1));
  }
}
