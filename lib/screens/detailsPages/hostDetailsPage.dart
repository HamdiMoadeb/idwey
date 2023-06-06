import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:idwey/utils/constants.dart';
import 'package:idwey/utils/enums.dart';
import 'package:idwey/widgets/listItems/ChaletListItem.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/host.dart';
import '../../services/hostCalls.dart';
import '../../utils/colors.dart';
import '../../utils/utils.dart';
import '../../widgets/common/CalanderCommon.dart';
import '../../widgets/common/ImageCommon.dart';
import '../../widgets/common/MapCommon.dart';
import '../../widgets/common/detailsWidgets.dart';
import '../../widgets/common/footer.dart';
import '../../widgets/common/scaffold.dart';

class HostDetailsPage extends StatefulWidget {
  int? id;
  TypeHost? typeHost;
  HostDetailsPage({Key? key, required this.id, required typeHost})
      : super(key: key);

  @override
  State<HostDetailsPage> createState() => _HostDetailsPageState();
}

class _HostDetailsPageState extends State<HostDetailsPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  SharedPreferences? prefs;

  bool loading = false;
  bool showFAB = false;
  bool isLiked = false;
  HostDetail hostDetail = HostDetail(0, '', '', '', '', [], 0, '', '', 0, '',
      '', '', [], '', '', 0, 0, [], '', []);

  String selectedCurrency = '';

  String currentImage = '';
  String slug = '';

  callHosts() async {
    setState(() {
      loading = true;
    });
    await _loadSelectedCurrency();

    HostCalls.getHostDetails(widget.id).then((result) async {
      setState(() {
        hostDetail = result['hostDetail'];
        currentImage = result['hostDetail'].gallery_images_url[0].large;
        currencies['EUR']['value'] = result["eur"];
        currencies['USD']['value'] = result["usd"];
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
    checkInternetConnectivity(context, callHosts);
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
                            title: hostDetail.title,
                            text: "Partager maintenant",
                            linkUrl:
                                "https://idwey.tn/fr/hebergement/maison-hote/tunisie/${replaceWhitespaces(hostDetail.title)}",
                            banner_image_url: hostDetail.banner_image_url,
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
                                    hostDetail.type.length != 0
                                        ? DetailIcons(
                                            icon: FontAwesomeIcons.house,
                                            type: 'Type',
                                            description: hostDetail.type[0],
                                          )
                                        : Container(),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    hostDetail.max_person > 1
                                        ? DetailIcons(
                                            icon: Icons.group,
                                            type: 'Personnes',
                                            description: hostDetail.max_person
                                                .toString(),
                                          )
                                        : Container(),
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
                                            description:
                                                hostDetail.impactsocial,
                                          )
                                        : Container(),
                                  ],
                                ),
                              ),
                              SectionDivider(),
                              ImageGallery(
                                title: hostDetail.title,
                                text: "Partager maintenant",
                                linkUrl:
                                    "https://idwey.tn/fr/hebergement/maison-hote/tunisie/${replaceWhitespaces(hostDetail.title)}",
                                currentImage: currentImage,
                                isLiked: isLiked,
                                gallery_images_url:
                                    hostDetail.gallery_images_url,
                                callBack: () {
                                  setState(() {
                                    isLiked = !isLiked;
                                  });
                                },
                              ),
                              widget.typeHost == TypeHost.parChalet
                                  ? SectionTitle(
                                      title:
                                          'Chalets disponibles'.toUpperCase())
                                  : SizedBox.shrink(),
                              widget.typeHost == TypeHost.parChalet
                                  ? ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: hostDetail.rooms?.length,
                                      itemBuilder: (context, index) {
                                        return ChaletListItem(
                                            hostDetail.rooms?[index],
                                            false,
                                            1,
                                            currencies[selectedCurrency]
                                                ['symbol']);
                                      })
                                  : SizedBox.shrink(),
                              SectionTitle(title: 'DESCRIPTION'),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 20),
                                child: HtmlWidget(
                                  hostDetail.content,
                                ),
                              ),
                              SectionTitle(
                                  title: 'Disponibilité'.toUpperCase()),
                              CustomCalendar(),
                              SectionTitle(
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
                                      style:
                                          TextStyle(color: grey, fontSize: 16),
                                    ),
                                    Text(
                                      '${hostDetail.check_in_time} H',
                                      style:
                                          TextStyle(color: grey, fontSize: 16),
                                    ),
                                    Text(
                                      'Sortie',
                                      style:
                                          TextStyle(color: grey, fontSize: 16),
                                    ),
                                    Text(
                                      '${hostDetail.check_out_time} H',
                                      style:
                                          TextStyle(color: grey, fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                              SectionTitle(
                                title: 'Emplacement'.toUpperCase(),
                              ),
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
                                      hostDetail.address,
                                      style:
                                          TextStyle(fontSize: 14, color: grey),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                  height: 300,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 15.0),
                                  child: MapPosition(
                                      title: hostDetail.title,
                                      lat: hostDetail.map_lat!,
                                      lng: hostDetail.map_lng!)),
                              SectionTitle(
                                title: 'Commodités'.toUpperCase(),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 15.0),
                                child: Column(
                                  children: [
                                    for (var item in hostDetail.convenience!)
                                      ConvenienceItem(title: item),
                                  ],
                                ),
                              ),
                              SectionTitle(
                                title: 'type de propriété'.toUpperCase(),
                              ),
                              hostDetail.type.length != 0
                                  ? Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15.0),
                                      child: Row(
                                        children: [
                                          getIconByTitle(hostDetail.type[0]),
                                          SizedBox(
                                            width: 15.0,
                                          ),
                                          Text(
                                            hostDetail.type[0],
                                            style: TextStyle(
                                                color: materialPrimary),
                                          )
                                        ],
                                      ),
                                    )
                                  : Container(),
                              SectionTitle(
                                title: 'avis'.toUpperCase(),
                              ),
                              RateStats()
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
                  per_person: hostDetail.per_person,
                  price:
                      '${removeDecimalZeroFormat(currencies[selectedCurrency]['symbol'] != 'DT' ? currencyConverteur(currencies[selectedCurrency]['value']!, hostDetail.price) : hostDetail.price)} ${currencies[selectedCurrency]['symbol']}',
                )
              : Container()
        ],
      ),
    );
  }
}
