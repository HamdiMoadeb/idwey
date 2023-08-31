import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:icofont_flutter/icofont_flutter.dart';
import 'package:idwey/screens/authPages/loginPage.dart';
import 'package:idwey/screens/verify_disponibility_page/verify_disponibility_page.dart';
import 'package:idwey/utils/enums.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/activity.dart';
import '../../services/activityCalls.dart';
import '../../utils/colors.dart';
import '../../utils/utils.dart';
import '../../widgets/common/ImageCommon.dart';
import '../../widgets/common/MapCommon.dart';
import '../../widgets/common/detailsWidgets.dart';
import '../../widgets/common/footer.dart';
import '../../widgets/common/scaffold.dart';

class ActivityDetailsPage extends StatefulWidget {
  int id;
  ActivityDetailsPage({Key? key, required this.id}) : super(key: key);

  @override
  State<ActivityDetailsPage> createState() => _ActivityDetailsPageState();
}

class _ActivityDetailsPageState extends State<ActivityDetailsPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  SharedPreferences? prefs;

  dynamic searchInputs = {'start': '', 'end': '', 'address': '', 'adults': ''};
  bool loading = false;
  bool showFAB = false;
  bool isLiked = false;
  ActivityDetail activityDetails = ActivityDetail(
      0, '', '', '', '', 0, 0, '', '', '', '', '', '', [], [], 0, 0, []);
  Map currencies = {
    'TND': {'value': 1, 'symbol': 'DT'},
    'EUR': {'value': 0, 'symbol': '€'},
    'USD': {'value': 0, 'symbol': '\$'},
  };
  String selectedCurrency = '';
  String currentImage = '';
  String slug = '';

  callActivities() {
    setState(() {
      loading = true;
    });
    ActivityCalls.getActivityDetails(widget.id).then((result) async {
      setState(() {
        activityDetails = result['activityDetail'];
        currencies['EUR']['value'] = result["eur"];
        currencies['USD']['value'] = result["usd"];
        if (result['activityDetail'].gallery_images_url.length != 0)
          currentImage = result['activityDetail'].gallery_images_url[0].large;
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
    checkInternetConnectivity(context, callActivities);
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ImageBanner(
                            title: activityDetails.title,
                            text: "Partager maintenant",
                            linkUrl:
                                "https://idwey.tn/fr/activity/${activityDetails.slug}",
                            banner_image_url: activityDetails.banner_image_url,
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
                                      activityDetails.title.trimLeft(),
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
                                        activityDetails.address,
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
                                      DetailIcons(
                                        icon: IcoFontIcons.wallClock,
                                        type: 'Duration',
                                        description:
                                            '${activityDetails.duration} heures',
                                      ),
                                      activityDetails.cat_name != ""
                                          ? Column(
                                              children: [
                                                SizedBox(
                                                  height: 12,
                                                ),
                                                DetailIcons(
                                                  icon: IcoFontIcons.tracking,
                                                  type: 'Type de l\'activité',
                                                  description:
                                                      activityDetails.cat_name,
                                                ),
                                              ],
                                            )
                                          : Container(),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      DetailIcons(
                                        icon: IcoFontIcons.group,
                                        type: 'Capacité',
                                        description:
                                            '${activityDetails.max_people} personnes',
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      DetailIcons(
                                        icon: IcoFontIcons.islandAlt,
                                        type: 'Emplacement',
                                        description:
                                            activityDetails.location_name,
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      activityDetails.impactsocial != ""
                                          ? DetailIcons(
                                              icon: FontAwesomeIcons.slideshare,
                                              type: 'Impact social',
                                              description:
                                                  activityDetails.impactsocial,
                                            )
                                          : Container(),
                                    ],
                                  ),
                                ),
                                SectionDivider(),
                                activityDetails.gallery_images_url.length != 0
                                    ? ImageGallery(
                                        title: activityDetails.title,
                                        text: "Partager maintenant",
                                        linkUrl:
                                            "https://idwey.tn/fr/activity/${activityDetails.slug}",
                                        currentImage: currentImage,
                                        isLiked: isLiked,
                                        gallery_images_url:
                                            activityDetails.gallery_images_url,
                                        callBack: () {
                                          setState(() {
                                            isLiked = !isLiked;
                                          });
                                        },
                                      )
                                    : Container(),
                                SectionTitle(title: 'DESCRIPTION'),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 20),
                                  child: HtmlWidget(
                                    activityDetails.content,
                                  ),
                                ),
                                SectionTitle(title: 'Style'.toUpperCase()),
                                Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 15.0),
                                  child: Column(
                                    children: [
                                      for (var item in activityDetails.style)
                                        StyleItem(title: item),
                                    ],
                                  ),
                                ),
                                if (activityDetails.convenience!.length !=
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
                                            in activityDetails.convenience!)
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
                                        activityDetails.address,
                                        style: TextStyle(
                                            fontSize: 14, color: grey),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                    height: 300,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15.0),
                                    child: MapPosition(
                                        title: activityDetails.title,
                                        lat: activityDetails.map_lat,
                                        lng: activityDetails.map_lng)),
                                SectionTitle(
                                  title: 'avis'.toUpperCase(),
                                ),
                                RateStats()
                              ]),
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
                  onPressed: () {
                    checkLoggedIn();
                  },
                  per_person: "",
                  price:
                      '${removeDecimalZeroFormat(currencies[selectedCurrency]['symbol'] != 'DT' ? currencyConverteur(currencies[selectedCurrency]['value']!, activityDetails.price) : activityDetails.price)} ${currencies[selectedCurrency]['symbol']}',
                )
              : Container()
        ],
      ),
    );
  }

  Future<void> checkLoggedIn() async {
    final user = prefs!.getString("token");
    if (user != null) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => VerifyDisponibility(
                    activityDuration: activityDetails.duration,
                    typeReservation: TypeReservation.activity,
                    //typeHost: widget.typeHost,
                    sale_price: activityDetails.price,
                    currency: currencies[selectedCurrency]['symbol'],
                    currencyValue: currencies[selectedCurrency]['value']!,
                    price: activityDetails.price,
                    // per_person: eventDetails.,
                    currencyName: selectedCurrency,
                    id: activityDetails.id.toString(),
                    title: activityDetails.title,
                    address: activityDetails.address,
                  )));
    } else {
      prefs!.setString('activityID', activityDetails.id.toString());
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const LoginPage()));
    }
  }
}
