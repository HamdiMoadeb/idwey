import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:idwey/utils/colors.dart';
import 'package:idwey/widgets/common/scaffold.dart';
import 'package:idwey/widgets/lists/activityListSection.dart';
import 'package:idwey/widgets/lists/blogListSection.dart';
import 'package:idwey/widgets/lists/desireListSection.dart';
import 'package:idwey/widgets/lists/destinationListSection.dart';
import 'package:idwey/widgets/lists/eventListSection.dart';
import 'package:idwey/widgets/lists/experienceListSection.dart';
import 'package:idwey/widgets/lists/hostListSection.dart';
import 'package:idwey/widgets/lists/idweySection.dart';
import 'package:idwey/widgets/lists/productListSection.dart';
import 'package:idwey/widgets/lists/testimonialListSection.dart';
import 'package:idwey/widgets/tabs/ActivityFilterTab.dart';
import 'package:idwey/widgets/tabs/EventFilterTab.dart';
import 'package:idwey/widgets/tabs/HostFilterTab.dart';

import '../services/homePageCalls.dart';
import '../utils/utils.dart';
import '../widgets/common/footer.dart';
import '../widgets/lists/partnerListSection.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  TabController? _tabController;
  final scrollController = ScrollController();

  List<String> carouselLinks = [];
  bool offline = false;
  bool showFAB = false;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();

    checkInternetConnectivity(context, getCarouselImages);

    scrollController.addListener(() {
      if (scrollController.position.pixels > 1000) {
        setState(() {
          showFAB = true;
        });
      }
      if (scrollController.position.pixels < 1000) {
        setState(() {
          showFAB = false;
        });
      }
    });
  }

  getCarouselImages() {
    HomePageCalls.getCarouselLinks().then((list) {
      if (list != null) {
        setState(() {
          carouselLinks = list;
          offline = false;
        });
      } else {
        setState(() {
          offline = true;
        });
      }
    });
  }

  void scrollToTop() {
    scrollController.animateTo(0,
        duration: const Duration(seconds: 2), curve: Curves.linear);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  getListsWidgets() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // HOST SECTION
        HostListSection(),
        // EVENT SECTION
        EventListSection(),
        // EXPERIENCE SECTION
        ExperienceListSection(),
        // ACTIVITY SECTION
        ActivityListSection(),
        // PRODUCT SECTION
        ProductListSection(),
        // FORCES SECTION
        IdweySection(),
        // YOUR DESIRES SECTION
        DesireListSection(),
        // DESTINATION SECTION
        DestinationListSection(),
        // INSPIRATION SECTION
        BlogListSection(),
        // TESTIMONIAL SECTION
        TestimonialListSection(),
        // PARTNERS SECTION
        PartnerListSection(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: primaryGrey));
    return CommonScaffold(
      scaffoldKey: _scaffoldKey,
      backtotop: scrollToTop,
      showFab: showFAB,
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: 230,
                    viewportFraction: 1,
                    autoPlayInterval: const Duration(seconds: 6),
                    enableInfiniteScroll: true,
                    autoPlay: true,
                  ),
                  items: carouselLinks.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: CachedNetworkImage(
                            imageUrl: i,
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
                        );
                      },
                    );
                  }).toList(),
                ),
                Container(
                  height: 40,
                  margin: const EdgeInsets.only(top: 192),
                  child: Container(
                    margin: const EdgeInsets.only(left: 4, right: 4),
                    decoration: BoxDecoration(
                      color: primary,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: TabBar(
                      controller: _tabController,
                      labelColor: Colors.white,
                      labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        color: primaryOrange,
                      ),
                      tabs: [
                        Tab(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              FaIcon(
                                FontAwesomeIcons.solidBuilding,
                                size: 15,
                                color: Colors.white,
                              ),
                              SizedBox(width: 8),
                              Text(
                                'Hébergement',
                                style: TextStyle(
                                  fontSize: 12.5,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Tab(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              FaIcon(
                                FontAwesomeIcons.calendarDays,
                                size: 15,
                                color: Colors.white,
                              ),
                              SizedBox(width: 8),
                              Text(
                                'Événement',
                                style: TextStyle(
                                  fontSize: 12.5,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Tab(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              FaIcon(
                                FontAwesomeIcons.umbrellaBeach,
                                size: 15,
                                color: Colors.white,
                              ),
                              SizedBox(width: 8),
                              Text(
                                'Activité',
                                style: TextStyle(
                                  fontSize: 12.5,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Container(
              height: 315,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 2),
              child: TabBarView(
                controller: _tabController,
                children: [
                  HostFilterTab(onChangeField: (dynamic searchInputs) => {}),
                  EventFilterTab(onChangeField: (dynamic searchInputs) => {}),
                  ActivityFilterTab(
                      onChangeField: (dynamic searchInputs) => {}),
                ],
              ),
            ),
            offline ? Container() : getListsWidgets(),
            //FOOTER
            Footer(),
            CreatedBy(),
            BackToTop(scrollToTop),
          ],
        ),
      ),
    );
  }
}
