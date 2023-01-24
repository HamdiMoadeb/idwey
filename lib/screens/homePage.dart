import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:idwey/utils/colors.dart';
import 'package:idwey/widgets/footer.dart';
import 'package:idwey/widgets/lists/activityListSection.dart';
import 'package:idwey/widgets/lists/desireListSection.dart';
import 'package:idwey/widgets/lists/destinationListSection.dart';
import 'package:idwey/widgets/lists/eventListSection.dart';
import 'package:idwey/widgets/lists/hostListSection.dart';
import 'package:idwey/widgets/lists/idweySection.dart';
import 'package:idwey/widgets/lists/productListSection.dart';
import 'package:idwey/widgets/lists/testimonialListSection.dart';
import 'package:idwey/widgets/tabs/ActivityFilterTab.dart';
import 'package:idwey/widgets/tabs/EventFilterTab.dart';
import 'package:idwey/widgets/tabs/HostFilterTab.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  TabController? _tabController;
  ScrollController? scrollController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    scrollController = ScrollController();
    super.initState();
  }

  void scrollToTop() {
    scrollController!.animateTo(0,
        duration: const Duration(seconds: 2), curve: Curves.linear);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: primaryGrey));
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      drawerEnableOpenDragGesture: false,
      endDrawerEnableOpenDragGesture: true,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: primaryGrey,
        title: SizedBox(
          width: 150,
          height: 50,
          child: Image.asset('assets/logoidwey.png'),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.menu_rounded,
              size: 30,
            ),
            onPressed: () {
              _scaffoldKey.currentState?.openEndDrawer();
            },
          ),
        ],
      ),
      endDrawer: const Drawer(),
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
                  items: [
                    "slider1.png",
                    "slider2.png",
                    "slider3.png",
                    "slider4.jpg",
                    "slider5.jpg"
                  ].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Image.asset("assets/$i", fit: BoxFit.cover),
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
              height: 290,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 2),
              child: TabBarView(
                controller: _tabController,
                children: const [
                  HostFilterTab(),
                  EventFilterTab(),
                  ActivityFilterTab(),
                ],
              ),
            ),
            // HOST SECTION
            HostListSection(),
            // EVENT SECTION
            EventListSection(),
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
            Container(
              margin: EdgeInsets.only(right: 15),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    child: Text(
                      'Inspirations',
                      style: TextStyle(
                        color: primary,
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: 30,
                    height: 30,
                    margin: EdgeInsets.only(right: 10),
                    child: ElevatedButton(
                        child: Icon(
                          Icons.navigate_before_sharp,
                          color: primary,
                          size: 25,
                        ),
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          shadowColor: Colors.white,
                          shape: CircleBorder(
                              side: BorderSide(
                            color: Colors.grey.shade300,
                          )),
                          padding: EdgeInsets.zero,
                          primary: Colors.white,
                        )),
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    child: ElevatedButton(
                        child: Icon(
                          Icons.navigate_next_sharp,
                          color: primary,
                          size: 25,
                        ),
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          shadowColor: Colors.white,
                          shape: CircleBorder(
                              side: BorderSide(
                            color: Colors.grey.shade300,
                          )),
                          padding: EdgeInsets.zero,
                          primary: Colors.white,
                        )),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 400,
              margin: EdgeInsets.only(left: 15, right: 15, top: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 220,
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        'assets/inspiration.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5, top: 10, bottom: 3),
                    child: Row(
                      children: [
                        Text(
                          'OUTDOOR',
                          style: TextStyle(
                            color: titleBlack,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          ' • ',
                          style: TextStyle(
                            color: grey,
                            fontSize: 25,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '24/02/2020',
                          style: TextStyle(
                            color: primary,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5, bottom: 15),
                    child: Text(
                      '8 Bonnes raisons de pratiquer des activités outdoors. ',
                      style: TextStyle(
                        color: titleBlack,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5, bottom: 15),
                    child: Text(
                      'Les vacances sont déjà loin et le stress et la fatigue commencent...',
                      style: TextStyle(
                        color: grey,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5),
                    child: Text(
                      'Lire Plus',
                      style: TextStyle(
                        shadows: [
                          Shadow(color: titleBlack, offset: Offset(0, -5))
                        ],
                        color: Colors.transparent,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.blue.shade700,
                        decorationThickness: 3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // TESTIMONIAL SECTION
            TestimonialListSection(),
            // PARTNERS SECTION
            Container(
              margin: EdgeInsets.only(right: 15, top: 30),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    child: Text(
                      'Ils nous font confiance',
                      style: TextStyle(
                        color: primary,
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: 30,
                    height: 30,
                    margin: EdgeInsets.only(right: 10),
                    child: ElevatedButton(
                        child: Icon(
                          Icons.navigate_before_sharp,
                          color: primary,
                          size: 25,
                        ),
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          shadowColor: Colors.white,
                          shape: CircleBorder(
                              side: BorderSide(
                            color: Colors.grey.shade300,
                          )),
                          padding: EdgeInsets.zero,
                          primary: Colors.white,
                        )),
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    child: ElevatedButton(
                        child: Icon(
                          Icons.navigate_next_sharp,
                          color: primary,
                          size: 25,
                        ),
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          shadowColor: Colors.white,
                          shape: CircleBorder(
                              side: BorderSide(
                            color: Colors.grey.shade300,
                          )),
                          padding: EdgeInsets.zero,
                          primary: Colors.white,
                        )),
                  ),
                ],
              ),
            ),
            Center(
              child: Container(
                width: 300,
                height: 150,
                child: Image.network(
                    "https://idwey.tn/uploads/0000/logopartenaire/ifm.png"),
              ),
            ),
            // FOOTER
            Footer(),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: Center(
                child: RichText(
                  text: TextSpan(
                    text: 'Made with ❤️ in Tunisia © 2023, Powered by ',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'IDWEY',
                        style: TextStyle(
                          color: primaryOrange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 35,
              width: 35,
              margin: EdgeInsets.only(left: 10, bottom: 10, top: 5),
              child: IconButton(
                onPressed: () {
                  scrollToTop();
                },
                icon: FaIcon(
                  FontAwesomeIcons.anglesUp,
                  color: primaryOrange,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
