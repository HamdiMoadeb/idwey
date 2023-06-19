import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:idwey/blocs/blocs.dart';
import 'package:idwey/utils/constants.dart';
import 'package:idwey/utils/enums.dart';
import 'package:idwey/utils/utils.dart';
import 'package:idwey/widgets/listItems/ChaletListItem.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../services/hostCalls.dart';
import '../../utils/colors.dart';
import '../../widgets/common/ImageCommon.dart';
import '../../widgets/common/MapCommon.dart';
import '../../widgets/common/detailsWidgets.dart';
import '../../widgets/common/footer.dart';
import '../../widgets/common/scaffold.dart';
import 'package:idwey/models/models.dart';

class HostDetailsPage extends StatefulWidget {
  final int? id;
  final TypeHost? typeHost;
  const HostDetailsPage({Key? key, required this.id, required this.typeHost})
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

  String selectedCurrency = 'TND';

  String currentImage = '';
  String slug = '';

  callHosts() async {
    await _loadSelectedCurrency();
    print(widget.id);
    //HostCalls.getHostDetails(widget.id).then((result) async {
    // setState(() {
    //   hostDetail = result['hostDetail'];
    //currentImage = state..gallery_images_url[0].large;
    //   currencies['EUR']['value'] = result["eur"];
    //   currencies['USD']['value'] = result["usd"];
    // });

    context.read<HostDetailCubit>().getHostDetails(widget.id);

    // await Future.delayed(Duration(seconds: 1));
    // });
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
    return BlocBuilder<HostDetailCubit, HostDetailState>(
      builder: (context, state) {
        return CommonScaffold(
          changeCurrency: _loadSelectedCurrency(),
          showFab: showFAB,
          backtotop: scrollToTop,
          scaffoldKey: _scaffoldKey,
          body: state.status == StateStatus.success
              ? Stack(
                  children: [
                    SingleChildScrollView(
                      controller: scrollController,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          state.status == StateStatus.loading
                              ? Container(
                                  height: 300,
                                  margin: EdgeInsets.all(30),
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          primary),
                                    ),
                                  ),
                                )
                              : Column(
                                  children: [
                                    ImageBanner(
                                      title:
                                          state.hostDetail?.host?.title ?? "",
                                      text: "Partager maintenant",
                                      linkUrl:
                                          "https://idwey.tn/fr/hebergement/maison-hote/tunisie/${replaceWhitespaces(state.hostDetail?.host?.title ?? "")}",
                                      banner_image_url:
                                          state.hostDetail?.bannerImageUrl ??
                                              "",
                                      isLiked: isLiked,
                                      callBack: () {
                                        setState(() {
                                          isLiked = !isLiked;
                                        });
                                      },
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            padding: EdgeInsets.only(
                                                top: 20.0, left: 20.0),
                                            child: Text(
                                              state.hostDetail?.host?.title ??
                                                  "",
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
                                                state.hostDetail?.host
                                                        ?.address ??
                                                    "",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: materialPrimary
                                                        .shade100),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SectionDivider(),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Column(
                                            children: [
                                              state.hostDetail?.host
                                                          ?.typeHost !=
                                                      null
                                                  ? DetailIcons(
                                                      icon: FontAwesomeIcons
                                                          .house,
                                                      type: 'Type',
                                                      description: state
                                                              .hostDetail
                                                              ?.host
                                                              ?.typeHost
                                                              .toString() ??
                                                          "",
                                                    )
                                                  : Container(),
                                              SizedBox(
                                                height: 12,
                                              ),
                                              state.hostDetail?.host
                                                          ?.maxPerson !=
                                                      null
                                                  ? DetailIcons(
                                                      icon: Icons.group,
                                                      type: 'Personnes',
                                                      description: state
                                                              .hostDetail
                                                              ?.host
                                                              ?.maxPerson!
                                                              .toString() ??
                                                          '',
                                                    )
                                                  : Container(),
                                              SizedBox(
                                                height: 12,
                                              ),
                                              DetailIcons(
                                                icon: FontAwesomeIcons
                                                    .mapLocationDot,
                                                type: 'Emplacement',
                                                description: state.hostDetail
                                                        ?.host?.locationName ??
                                                    "",
                                              ),
                                              SizedBox(
                                                height: 12,
                                              ),
                                              state.hostDetail?.host
                                                          ?.impactsocial !=
                                                      ""
                                                  ? DetailIcons(
                                                      icon: FontAwesomeIcons
                                                          .slideshare,
                                                      type: 'Impact social',
                                                      description: state
                                                              .hostDetail
                                                              ?.host
                                                              ?.impactsocial ??
                                                          "",
                                                    )
                                                  : Container(),
                                            ],
                                          ),
                                        ),
                                        SectionDivider(),
                                        ImageGallery(
                                          currentImage: state
                                                  .hostDetail
                                                  ?.galleryImagesUrl?[0]
                                                  .large ??
                                              "",
                                          title:
                                              state.hostDetail?.host?.title ??
                                                  "",
                                          text: "Partager maintenant",
                                          linkUrl:
                                              "https://idwey.tn/fr/hebergement/maison-hote/tunisie/${replaceWhitespaces(state.hostDetail?.host?.title ?? "")}",

                                          isLiked: isLiked,
                                          gallery_images_url: state.hostDetail
                                                  ?.galleryImagesUrl ??
                                              [],
                                          //   hostDetail.gallery_images_url,
                                          callBack: () {
                                            setState(() {
                                              isLiked = !isLiked;
                                            });
                                          },
                                        ),
                                        widget.typeHost == TypeHost.PAR_CHALET
                                            ? SectionTitle(
                                                title: 'Chalets disponibles'
                                                    .toUpperCase())
                                            : const SizedBox.shrink(),
                                        widget.typeHost == TypeHost.PAR_CHALET
                                            ? ListView.builder(
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                shrinkWrap: true,
                                                itemCount: state
                                                    .hostDetail?.rooms?.length,
                                                itemBuilder: (context, index) {
                                                  return ChaletListItem(
                                                      state.hostDetail
                                                          ?.rooms?[index],
                                                      false,
                                                      currencies["TND"]
                                                          ['value'],
                                                      currencies["TND"]
                                                          ['symbol']);
                                                })
                                            : SizedBox.shrink(),
                                        SectionTitle(title: 'DESCRIPTION'),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10.0, horizontal: 20),
                                          child: HtmlWidget(
                                            state.hostDetail?.host?.content ??
                                                "",
                                          ),
                                        ),
                                        // SectionTitle(
                                        //     title: 'Disponibilité'.toUpperCase()),
                                        // CustomCalendar(),
                                        SectionTitle(
                                          title: 'Règlement'.toUpperCase(),
                                        ),
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 20),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Entrée',
                                                style: TextStyle(
                                                    color: grey, fontSize: 16),
                                              ),
                                              Text(
                                                '${state.hostDetail?.host?.checkInTime} H',
                                                style: TextStyle(
                                                    color: grey, fontSize: 16),
                                              ),
                                              Text(
                                                'Sortie',
                                                style: TextStyle(
                                                    color: grey, fontSize: 16),
                                              ),
                                              Text(
                                                '${state.hostDetail?.host?.checkOutTime} H',
                                                style: TextStyle(
                                                    color: grey, fontSize: 16),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SectionTitle(
                                          title: 'Emplacement'.toUpperCase(),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(left: 20.0),
                                          margin: EdgeInsets.only(
                                              bottom: 20.0, top: 10.0),
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
                                                state.hostDetail?.host
                                                        ?.address ??
                                                    "",
                                                style: TextStyle(
                                                    fontSize: 14, color: grey),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                            height: 300,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 15.0),
                                            child: MapPosition(
                                                title: state.hostDetail?.host
                                                        ?.title ??
                                                    "",
                                                lat: double.tryParse(state
                                                            .hostDetail
                                                            ?.host
                                                            ?.mapLat ??
                                                        "") ??
                                                    0.0,
                                                lng: double.tryParse(state
                                                            .hostDetail
                                                            ?.host
                                                            ?.mapLng ??
                                                        "") ??
                                                    0.0)),
                                        SectionTitle(
                                          title: 'Commodités'.toUpperCase(),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15.0),
                                          child: Column(
                                            children: [
                                              if (state
                                                      .hostDetail?.attributes !=
                                                  null)
                                                for (var item in state
                                                        .hostDetail
                                                        ?.conveniences ??
                                                    [])
                                                  ConvenienceItem(
                                                      title: item ?? ""),
                                            ],
                                          ),
                                        ),
                                        SectionTitle(
                                          title:
                                              'type de propriété'.toUpperCase(),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15.0),
                                          child: Row(
                                            children: [
                                              getIconByTitle(
                                                  state.hostDetail?.type?[0] ??
                                                      ""),
                                              SizedBox(
                                                width: 15.0,
                                              ),
                                              Text(
                                                typeHostValues.map.keys
                                                    .firstWhere((key) =>
                                                        typeHostValues
                                                            .map[key] ==
                                                        widget.typeHost),
                                                style: const TextStyle(
                                                    color: materialPrimary),
                                              )
                                            ],
                                          ),
                                        ),

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
                    !(state.status == StateStatus.loading)
                        ? BottomReservationBar(
                            per_person: typeHostValues.map.keys.firstWhere(
                                (key) =>
                                    typeHostValues.map[key] == widget.typeHost),
                            price:
                                '${removeDecimalZeroFormat(currencies[selectedCurrency]['symbol'] != 'DT' ? currencyConverteur(currencies[selectedCurrency]['value']!, state.hostDetail?.host?.price ?? "") : state.hostDetail?.host?.price ?? "")} ${currencies[selectedCurrency]['symbol']}',
                          )
                        : Container()
                  ],
                )
              : const CircularProgressIndicator(),
        );
      },
    );
  }
}
