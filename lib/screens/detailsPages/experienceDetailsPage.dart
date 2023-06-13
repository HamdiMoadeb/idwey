import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:icofont_flutter/icofont_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/experience.dart';
import '../../services/experienceCalls.dart';
import '../../utils/colors.dart';
import '../../utils/utils.dart';
import '../../widgets/common/ImageCommon.dart';
import '../../widgets/common/MapCommon.dart';
import '../../widgets/common/detailsWidgets.dart';
import '../../widgets/common/footer.dart';
import '../../widgets/common/scaffold.dart';

class ExperienceDetailsPage extends StatefulWidget {
  int? id;
  ExperienceDetailsPage({Key? key, required this.id}) : super(key: key);

  @override
  State<ExperienceDetailsPage> createState() => _ExperienceDetailsPageState();
}

class _ExperienceDetailsPageState extends State<ExperienceDetailsPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  SharedPreferences? prefs;

  bool loading = false;
  bool showFAB = false;
  bool isLiked = false;
  ExperienceDetails experienceDetail = new ExperienceDetails(
      0, '', '', '', '', '', '', 0, '', 0, '', '', '', [], 0, 0, []);
  Map currencies = {
    'TND': {'value': 1, 'symbol': 'DT'},
    'EUR': {'value': 0, 'symbol': '€'},
    'USD': {'value': 0, 'symbol': '\$'},
  };
  String selectedCurrency = '';
  String currentImage = '';
  String slug = '';

  callExperience() {
    setState(() {
      loading = true;
    });
    ExperienceCalls.getExperienceDetails(widget.id).then((result) async {
      setState(() {
        experienceDetail = result['experienceDetail'];
        currencies['EUR']['value'] = result["eur"];
        currencies['USD']['value'] = result["usd"];
        if (result['experienceDetail'].gallery_images_url.length != 0)
          currentImage = result['experienceDetail'].gallery_images_url[0].large;
      });
      await Future.delayed(Duration(seconds: 1));
      setState(() {
        loading = false;
      });
    });
  }

  Future<void> _loadSelectedCurrency() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedCurrency = prefs?.getString('selectedCurrency') ?? 'TND';
    });
  }

  @override
  void initState() {
    checkInternetConnectivity(context, callExperience);
    super.initState();
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
      changeCurrency: _loadSelectedCurrency(),
      showFab: showFAB,
      backtotop: scrollToTop,
      scaffoldKey: _scaffoldKey,
      body: Stack(
        children: [
          SingleChildScrollView(
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
                          ImageBanner(
                            title: experienceDetail.title!,
                            text: "Partager maintenant",
                            linkUrl:
                                "https://idwey.tn/fr/experience/${experienceDetail.title}",
                            banner_image_url: experienceDetail.banner_image_url,
                            isLiked: isLiked,
                            callBack: () {
                              setState(() {
                                isLiked = !isLiked;
                              });
                            },
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  padding:
                                      EdgeInsets.only(top: 20.0, left: 20.0),
                                  child: Text(
                                    experienceDetail.title!,
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
                                      experienceDetail.address!,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
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
                                    experienceDetail.duration != ""
                                        ? DetailIcons(
                                            icon: IcoFontIcons.wallClock,
                                            type: 'Durée',
                                            description:
                                                "${experienceDetail.duration} heures",
                                          )
                                        : SizedBox(),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    experienceDetail.cat_name != ""
                                        ? DetailIcons(
                                            icon: IcoFontIcons.tracking,
                                            type: 'Type de l\'expérience',
                                            description:
                                                "${experienceDetail.cat_name}",
                                          )
                                        : SizedBox(),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    experienceDetail.max_people != 0
                                        ? DetailIcons(
                                            icon: Icons.group,
                                            type: 'Capacité',
                                            description:
                                                "${experienceDetail.max_people} personnes",
                                          )
                                        : SizedBox(),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    experienceDetail.location_name != ""
                                        ? DetailIcons(
                                            icon: IcoFontIcons.islandAlt,
                                            type: 'Emplacement',
                                            description:
                                                experienceDetail.location_name,
                                          )
                                        : SizedBox(),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    experienceDetail.impactsocial != ""
                                        ? DetailIcons(
                                            icon: FontAwesomeIcons.slideshare,
                                            type: 'Impact social',
                                            description:
                                                experienceDetail.impactsocial!,
                                          )
                                        : Container(),
                                  ],
                                ),
                              ),
                              SectionDivider(),
                              experienceDetail.gallery_images_url.length != 0
                                  ? ImageGallery(
                                      title: experienceDetail.title!,
                                      text: "Partager maintenant",
                                      linkUrl:
                                          "https://idwey.tn/fr/experience/${experienceDetail.slug}",
                                      currentImage: currentImage,
                                      isLiked: isLiked,
                                      gallery_images_url:
                                          experienceDetail.gallery_images_url,
                                      callBack: () {
                                        setState(() {
                                          isLiked = !isLiked;
                                        });
                                      },
                                    )
                                  : SizedBox(),
                              SectionTitle(title: 'DESCRIPTION'),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 20),
                                child: HtmlWidget(
                                  experienceDetail.content,
                                ),
                              ),
                              if (experienceDetail.convenience!.length !=
                                  0) ...[
                                SectionTitle(
                                  title: 'Commodités'.toUpperCase(),
                                ),
                                Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 15.0),
                                  child: Column(
                                    children: [
                                      for (var item
                                          in experienceDetail.convenience!)
                                        StyleItem(title: item),
                                    ],
                                  ),
                                ),
                              ] else
                                SizedBox(),
                              SectionTitle(
                                  title: 'EMPLACEMENT DE L’ACTIVITÉ'
                                      .toUpperCase()),
                              Container(
                                padding: EdgeInsets.only(left: 20.0),
                                margin:
                                    EdgeInsets.only(bottom: 20.0, top: 10.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.locationArrow,
                                      size: 14,
                                      color: grey,
                                    ),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    Text(
                                      experienceDetail.address!,
                                      style:
                                          TextStyle(fontSize: 14, color: grey),
                                    ),
                                  ],
                                ),
                              ),
                              // Container(
                              //     height: 300,
                              //     padding:
                              //         EdgeInsets.symmetric(horizontal: 15.0),
                              //     child: MapPosition(
                              //         title: experienceDetail.title!,
                              //         lat: experienceDetail.map_lat,
                              //         lng: experienceDetail.map_lng)),
                            ],
                          ),
                        ],
                      ),
                Footer(),
                CreatedBy(),
                BackToTop(scrollToTop),
                SizedBox(height: 70),
              ],
            ),
          ),
          !loading
              ? BottomReservationBar(
                  price:
                      '${removeDecimalZeroFormat(currencies[selectedCurrency]['symbol'] != 'DT' ? currencyConverteur(currencies[selectedCurrency]['value']!, experienceDetail.price!) : experienceDetail.price!)} ${currencies[selectedCurrency]['symbol']}',
                )
              : Container()
        ],
      ),
    );
  }
}
