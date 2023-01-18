import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:idwey/utils/colors.dart';
import 'package:idwey/widgets/ActivityFilterTab.dart';
import 'package:idwey/widgets/EventFilterTab.dart';
import 'package:idwey/widgets/HostFilterTab.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
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
            Container(
              margin: EdgeInsets.only(top: 30, left: 15),
              child: Text(
                'Logements authentiques',
                style: TextStyle(
                  color: primary,
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Divider(
              thickness: 1,
              height: 10,
              indent: 15,
              endIndent: 15,
            ),
            Container(
              margin: EdgeInsets.only(top: 8, left: 15),
              child: Text(
                'Vous cherchez où passer la nuit ? Y\'a pas mieux que les logements authentiques',
                style: TextStyle(
                  color: grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 15),
              child: Row(
                children: [
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
              margin: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.grey.shade300,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 220,
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                          child: Image.asset(
                            'assets/hostcover.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 20,
                        child: Container(
                          width: 80,
                          height: 26,
                          padding: const EdgeInsets.only(left: 8, top: 5),
                          decoration: BoxDecoration(
                            color: primaryOrange,
                          ),
                          child: const Text(
                            'En Vedette',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Container(
                          height: 28,
                          padding:
                              const EdgeInsets.only(left: 8, top: 5, right: 8),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(10),
                            ),
                            color: primaryOrange,
                          ),
                          child: const Text(
                            'Ferme écologique',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          width: 35,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                            ),
                            color: Colors.black.withOpacity(0.5),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.favorite_outline,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 15),
                    child: Text(
                      'Village Ken',
                      style: TextStyle(
                        color: titleBlack,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 8),
                    child: Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.solidPaperPlane,
                          size: 11,
                          color: grey,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          'Sousse',
                          style: TextStyle(
                            color: grey,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 10),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 12),
                          child: Column(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.userGroup,
                                size: 14,
                                color: grey,
                              ),
                              const SizedBox(height: 3),
                              Text(
                                '50',
                                style: TextStyle(
                                  color: primary,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 12),
                          child: Column(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.mapLocationDot,
                                size: 14,
                                color: grey,
                              ),
                              const SizedBox(height: 3),
                              Text(
                                'Campagne',
                                style: TextStyle(
                                  color: primary,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Column(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.slideshare,
                                size: 14,
                                color: grey,
                              ),
                              const SizedBox(height: 3),
                              Text(
                                'Impact',
                                style: TextStyle(
                                  color: primary,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 8),
                    child: Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.bolt,
                          size: 14,
                          color: Colors.amber,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '85 DT',
                          style: TextStyle(
                            color: titleBlack,
                            fontSize: 19,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          ' /personne',
                          style: TextStyle(
                            color: grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                      ),
                      color: primaryOrange,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Votre réservation = ',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        FaIcon(
                          FontAwesomeIcons.tree,
                          size: 15,
                          color: Colors.green,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // EVENT SECTION
            Container(
              margin: EdgeInsets.only(top: 30, left: 15),
              child: Text(
                'Calendrier d\'événements',
                style: TextStyle(
                  color: primary,
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Divider(
              thickness: 1,
              height: 10,
              indent: 15,
              endIndent: 15,
            ),
            Container(
              margin: EdgeInsets.only(top: 8, left: 15),
              child: Text(
                'Vous manquez d\'inspiration ? Découvrez notre calendrier d\'événements sur toute la Tunisie !',
                style: TextStyle(
                  color: grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 15),
              child: Row(
                children: [
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
              margin: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.grey.shade300,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 220,
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                          child: Image.asset(
                            'assets/eventcover.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        child: Container(
                          height: 28,
                          padding:
                              const EdgeInsets.only(left: 8, top: 5, right: 8),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(10),
                            ),
                            color: primaryOrange,
                          ),
                          child: const Text(
                            'Randonnée',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          width: 35,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                            ),
                            color: Colors.black.withOpacity(0.5),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.favorite_outline,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 15),
                    child: Text(
                      'Randonnée el Homrane (Ain Drahem) ',
                      style: TextStyle(
                        color: titleBlack,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 8),
                    child: Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.calendarDays,
                          size: 14,
                          color: primaryOrange,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '22-01-2023',
                          style: TextStyle(
                            color: titleBlack,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 10),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 12),
                          child: Column(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.userGroup,
                                size: 14,
                                color: grey,
                              ),
                              const SizedBox(height: 3),
                              Text(
                                '9',
                                style: TextStyle(
                                  color: primary,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 12),
                          child: Column(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.pepperHot,
                                size: 14,
                                color: grey,
                              ),
                              const SizedBox(height: 3),
                              Text(
                                'Facile',
                                style: TextStyle(
                                  color: primary,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Column(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.clock,
                                size: 14,
                                color: grey,
                              ),
                              const SizedBox(height: 3),
                              Text(
                                '12 H',
                                style: TextStyle(
                                  color: primary,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 8),
                    child: Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.bolt,
                          size: 14,
                          color: Colors.amber,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '45 DT',
                          style: TextStyle(
                            color: titleBlack,
                            fontSize: 19,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          ' /personne',
                          style: TextStyle(
                            color: grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                      ),
                      color: primaryOrange,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Votre réservation = ',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        FaIcon(
                          FontAwesomeIcons.tree,
                          size: 15,
                          color: Colors.green,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // ACTIVITY SECTION
            Container(
              margin: EdgeInsets.only(top: 30, left: 15),
              child: Text(
                'Expériences à vivre',
                style: TextStyle(
                  color: primary,
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Divider(
              thickness: 1,
              height: 10,
              indent: 15,
              endIndent: 15,
            ),
            Container(
              margin: EdgeInsets.only(top: 8, left: 15, bottom: 5),
              child: Text(
                'Vous appréciez la découverte ? Vivez l\'expérience !',
                style: TextStyle(
                  color: grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 15),
              child: Row(
                children: [
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
              margin: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.grey.shade300,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 220,
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                          child: Image.asset(
                            'assets/activitycover.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        child: Container(
                          height: 28,
                          padding:
                              const EdgeInsets.only(left: 8, top: 5, right: 8),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(10),
                            ),
                            color: primaryOrange,
                          ),
                          child: const Text(
                            'Journée détente',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          width: 35,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                            ),
                            color: Colors.black.withOpacity(0.5),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.favorite_outline,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 15),
                    child: Text(
                      'Weekend Permaculture',
                      style: TextStyle(
                        color: titleBlack,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 8),
                    child: Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.solidPaperPlane,
                          size: 11,
                          color: grey,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          'Hajeb El Ayoun , Kairouan',
                          style: TextStyle(
                            color: grey,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 10),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 12),
                          child: Column(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.userGroup,
                                size: 14,
                                color: grey,
                              ),
                              const SizedBox(height: 3),
                              Text(
                                '20',
                                style: TextStyle(
                                  color: primary,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Column(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.clock,
                                size: 14,
                                color: grey,
                              ),
                              const SizedBox(height: 3),
                              Text(
                                '24 H',
                                style: TextStyle(
                                  color: primary,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 8),
                    child: Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.bolt,
                          size: 14,
                          color: Colors.amber,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '70 DT',
                          style: TextStyle(
                            color: titleBlack,
                            fontSize: 19,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          ' /personne',
                          style: TextStyle(
                            color: grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                      ),
                      color: primaryOrange,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Votre réservation = ',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        FaIcon(
                          FontAwesomeIcons.tree,
                          size: 15,
                          color: Colors.green,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // PRODUCT SECTION
            Container(
              margin: EdgeInsets.only(top: 30, left: 15),
              child: Text(
                'Produits',
                style: TextStyle(
                  color: primary,
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 400,
              margin: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.grey.shade300,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 220,
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                          child: Image.asset(
                            'assets/jeu.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          width: 35,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                            ),
                            color: Colors.black.withOpacity(0.5),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.favorite_outline,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 15),
                    child: Text(
                      'Action vérité Bitounsi',
                      style: TextStyle(
                        color: titleBlack,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 8, bottom: 5),
                    child: Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.circleCheck,
                          size: 14,
                          color: Colors.amber,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          'Jeux de société',
                          style: TextStyle(
                            color: titleBlack,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 8, bottom: 15),
                    child: Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.bolt,
                          size: 14,
                          color: Colors.amber,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '45 DT',
                          style: TextStyle(
                            color: titleBlack,
                            fontSize: 19,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                      ),
                      color: primaryOrange,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Votre commande = ',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        FaIcon(
                          FontAwesomeIcons.tree,
                          size: 15,
                          color: Colors.green,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
