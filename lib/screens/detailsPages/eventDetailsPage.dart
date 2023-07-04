import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:icofont_flutter/icofont_flutter.dart';
import 'package:idwey/models/event.dart';
import 'package:idwey/screens/authPages/loginPage.dart';
import 'package:idwey/screens/verify_disponibility_page/verify_disponibility_page.dart';
import 'package:idwey/services/eventCalls.dart';
import 'package:idwey/utils/enums.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/colors.dart';
import '../../utils/utils.dart';
import '../../widgets/common/ImageCommon.dart';
import '../../widgets/common/MapCommon.dart';
import '../../widgets/common/detailsWidgets.dart';
import '../../widgets/common/footer.dart';
import '../../widgets/common/scaffold.dart';

class EventDetailsPage extends StatefulWidget {
  int? id;
  EventDetailsPage({Key? key, required this.id}) : super(key: key);

  @override
  State<EventDetailsPage> createState() => _EventDetailsPageState();
}

class _EventDetailsPageState extends State<EventDetailsPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  SharedPreferences? prefs;

  bool isExpanded = false;
  bool loading = false;
  bool showFAB = false;
  bool isLiked = false;
  bool showMore = false;
  String currentImage = '';

  EventDetails eventDetails = EventDetails(0, '', '', '', '', '', 0, '', '', 0,
      '', '', '', '', '', '', '', [], 0, 0, [], '', '', '', 0, 1);
  Map currencies = {
    'TND': {'value': 1, 'symbol': 'DT'},
    'EUR': {'value': 0, 'symbol': '€'},
    'USD': {'value': 0, 'symbol': '\$'},
  };
  String selectedCurrency = '';
  callEvents() {
    setState(() {
      loading = true;
    });
    EventCalls.getEventDetails(widget.id!).then((result) async {
      setState(() {
        eventDetails = result['eventDetail'];
        currencies['EUR']['value'] = result["eur"];
        currencies['USD']['value'] = result["usd"];
        if (result['eventDetail'].gallery_images_url.length != 0)
          currentImage = result['eventDetail'].gallery_images_url[0].large;
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
    print("********************");
    checkInternetConnectivity(context, callEvents);
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
      body: Stack(children: [
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
                          title: eventDetails.title!,
                          text: "Partager maintenant",
                          linkUrl:
                              "https://idwey.tn/fr/event/${eventDetails.slug}",
                          banner_image_url: eventDetails.banner_image_url,
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
                                padding: EdgeInsets.only(top: 20.0, left: 20.0),
                                child: Text(
                                  eventDetails.title!,
                                  style: TextStyle(
                                      fontSize: 28.0,
                                      fontWeight: FontWeight.w500,
                                      color: titleBlack),
                                )),
                            eventDetails.address!.isNotEmpty
                                ? Container(
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
                                          eventDetails.address!,
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: materialPrimary.shade100),
                                        ),
                                      ],
                                    ),
                                  )
                                : Container(),
                            Container(
                              padding: EdgeInsets.only(left: 20.0),
                              child: Row(
                                children: [
                                  Icon(
                                    IcoFontIcons.calendar,
                                    size: 20,
                                    color: primaryOrange,
                                  ),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    //"",
                                    DateFormat('dd-MM-yyyy').format(
                                        DateTime.parse(
                                            eventDetails.start_date ?? "")),
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: titleBlack),
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
                                    icon: Icons.group,
                                    type: 'Personnes',
                                    description:
                                        "${eventDetails.number.toString()} personnes",
                                  ),
                                  SizedBox(
                                    height:
                                        eventDetails.duration != '' ? 12 : 0,
                                  ),
                                  eventDetails.duration != ''
                                      ? DetailIcons(
                                          icon: IcoFontIcons.wallClock,
                                          type: 'Durée',
                                          description:
                                              "${eventDetails.duration} heures",
                                        )
                                      : const SizedBox(),
                                  SizedBox(
                                    height:
                                        eventDetails.distance != '' ? 12 : 0,
                                  ),
                                  eventDetails.distance != ''
                                      ? DetailIcons(
                                          icon: IcoFontIcons.mapPins,
                                          type: 'Distance',
                                          description:
                                              "${eventDetails.distance} Km",
                                        )
                                      : const SizedBox(),
                                  SizedBox(
                                    height:
                                        eventDetails.difficulty != '' ? 12 : 0,
                                  ),
                                  eventDetails.difficulty != ''
                                      ? DetailIcons(
                                          icon: IcoFontIcons.flash,
                                          type: 'Difficulté',
                                          description:
                                              "${eventDetails.difficulty}",
                                        )
                                      : SizedBox(),
                                  SizedBox(
                                    height:
                                        eventDetails.impactsocial!.isNotEmpty &&
                                                eventDetails.impactsocial == "1"
                                            ? 12
                                            : 0,
                                  ),
                                  eventDetails.impactsocial!.isNotEmpty &&
                                          eventDetails.impactsocial == "1"
                                      ? DetailIcons(
                                          icon: FontAwesomeIcons.slideshare,
                                          type: 'Impact social',
                                          description: 'Oui',
                                        )
                                      : const SizedBox(),
                                  SizedBox(
                                    height: 12,
                                  ),
                                ],
                              ),
                            ),
                            SectionDivider(),
                            eventDetails.gallery_images_url.length != 0
                                ? ImageGallery(
                                    title: eventDetails.title!,
                                    text: "Partager maintenant",
                                    linkUrl:
                                        "https://idwey.tn/fr/event/${eventDetails.slug}",
                                    currentImage: currentImage,
                                    isLiked: isLiked,
                                    gallery_images_url:
                                        eventDetails.gallery_images_url,
                                    callBack: () {
                                      setState(() {
                                        isLiked = !isLiked;
                                      });
                                    },
                                  )
                                : SizedBox(),
                            SectionTitle(title: 'DESCRIPTION'),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: HtmlWidget(
                                eventDetails.content!,
                              ),
                            ),
                            if (eventDetails.convenience!.length > 0)
                              Column(
                                children: [
                                  SectionTitle(
                                    title: 'Commodités'.toUpperCase(),
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15.0),
                                    child: Column(
                                      children: [
                                        for (var item
                                            in eventDetails.convenience!)
                                          StyleItem(title: item),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            eventDetails.map_lat != 0 &&
                                    eventDetails.map_lng != 0
                                ? Column(
                                    children: [
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
                                              eventDetails.address!,
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
                                              title: eventDetails.title!,
                                              lat: eventDetails.map_lat!,
                                              lng: eventDetails.map_lng!)),
                                    ],
                                  )
                                : SizedBox(),
                            SectionTitle(
                              title: 'avis'.toUpperCase(),
                            ),
                            RateStats(),
                          ],
                        ),
                        OwnerWidget(
                          name: eventDetails.business_name,
                          image: eventDetails.author_image_url,
                          date: eventDetails.created_at,
                        )
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
                stateEvent: eventDetails.isFull == 1
                    ? StateEvent.isFull
                    : eventDetails.isExpired == 1
                        ? StateEvent.isExpired
                        : StateEvent.isAvailable,
                price:
                    '${removeDecimalZeroFormat(currencies[selectedCurrency]['symbol'] != 'DT' ? currencyConverteur(currencies[selectedCurrency]['value']!, eventDetails.price!) : eventDetails.price!)} ${currencies[selectedCurrency]['symbol']}',
              )
            : Container()
      ]),
    );
  }

  Future<void> checkLoggedIn() async {
    final user = prefs!.getString("token");
    if (user != null) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => VerifyDisponibility(
                    // hostDetail: hostDetail,
                    startDate: eventDetails.start_date,
                    typeReservation: TypeReservation.event,
                    //typeHost: widget.typeHost,
                    sale_price: eventDetails.price,
                    currency: currencies[selectedCurrency]['symbol'],
                    currencyValue: currencies[selectedCurrency]['value']!,
                    price: eventDetails.price,
                    // per_person: eventDetails.,
                    currencyName: selectedCurrency,
                    id: eventDetails.id.toString(),
                    title: eventDetails.title ?? "",
                    address: eventDetails.address!,
                  )));
    } else {
      prefs!.setString('hostID', eventDetails.id.toString());
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const LoginPage()));
    }
  }
}
