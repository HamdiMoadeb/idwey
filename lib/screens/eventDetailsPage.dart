import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:icofont_flutter/icofont_flutter.dart';
import 'package:idwey/models/event.dart';
import 'package:idwey/services/eventCalls.dart';

import '../utils/colors.dart';
import '../utils/utils.dart';
import '../widgets/common/ImageCommon.dart';
import '../widgets/common/MapCommon.dart';
import '../widgets/common/detailsWidgets.dart';
import '../widgets/common/footer.dart';
import '../widgets/common/scaffold.dart';

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
  bool loading = false;
  bool showFAB = false;
  bool isLiked = false;
  bool showMore = false;
  String currentImage = '';
  EventDetails eventDetails = EventDetails(0, '', '','', '', 0, '', '', 0, '', '', '', '', '', '', [], 0, 0, []);
  callEvents() {
    setState(() {
      loading = true;
    });
    EventCalls.getEventDetails(widget.id!).then((event) async {
      setState(() {
        eventDetails = event;
        if (event.gallery_images_url.length != 0)
          currentImage = event.gallery_images_url[0].large;
      });
      await Future.delayed(Duration(seconds: 1));
      setState(() {
        loading = false;
      });
    });
  }

  @override
  void initState() {
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
                padding:
                EdgeInsets.only(top: 20.0, left: 20.0),
                child: Text(
                  eventDetails.title!,
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
                    eventDetails.address!,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: materialPrimary.shade100),
                  ),
                ],
              ),
            ),
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
                    eventDetails.start_date!,
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
                    height: 12,
                  ),
                  eventDetails.duration !='' ?
                  DetailIcons(
                    icon: IcoFontIcons.wallClock,
                    type: 'Difficulté',
                    description: "${eventDetails.duration} heures",
                  ): const SizedBox(),
                  SizedBox(
                    height: 12,
                  ),
                  DetailIcons(
                    icon: IcoFontIcons.flash,
                    type: 'Difficulté',
                    description: "${eventDetails.difficulty}",
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  eventDetails.impactsocial != ""
                      ? DetailIcons(
                    icon: FontAwesomeIcons.slideshare,
                    type: 'Impact social',
                    description:
                    eventDetails.impactsocial!,
                  )
                      : const SizedBox(),
                  SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
            eventDetails.gallery_images_url.length !=0 ?
            ImageGallery(
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
            ):SizedBox(),
            SectionTitle(title: 'DESCRIPTION'),
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: 10.0, horizontal: 20),
              child: HtmlWidget(
               eventDetails.content! ,
              ),
            ),
            SectionTitle(
              title: 'Commodités'.toUpperCase(),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: [
                  for (var item in eventDetails.convenience!)
                    StyleItem(title: item),
                ],
              ),
            ),
            eventDetails.map_lat!=0 && eventDetails.map_lng!=0 ?
            Column(
              children: [
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
                        eventDetails.address!,
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
                        title: eventDetails.title!,
                        lat: eventDetails.map_lat!,
                        lng: eventDetails.map_lng!)),
              ],
            ): SizedBox(),
            SectionTitle(
              title: 'avis'.toUpperCase(),
            ),
            RateStats(),

          ],),
                        Footer(),
                        CreatedBy(),
                        BackToTop(scrollToTop),
                        SizedBox(height: 70),
                      ],
                    ),

            ],
          ),
        ),
        !loading
            ? BottomReservationBar(
          price: eventDetails.price!,
        )
            : Container()
      ]),
    );
  }
}
