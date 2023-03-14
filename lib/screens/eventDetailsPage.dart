import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:idwey/models/event.dart';

import '../utils/colors.dart';
import '../widgets/common/ImageCommon.dart';
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
  EventDetails eventDetails =
      EventDetails(0, '', '', '', '', 0, '', 0, '', '', '', '', '');
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
                          banner_image_url: '',
                          isLiked: isLiked,
                          callBack: () {
                            setState(() {
                              isLiked = !isLiked;
                            });
                          },
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ]),
    );
  }
}
