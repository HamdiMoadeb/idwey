import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:idwey/utils/colors.dart';
import 'package:idwey/widgets/ForcesSectionItem.dart';
import 'package:idwey/widgets/lists/activityListSection.dart';
import 'package:idwey/widgets/lists/eventListSection.dart';
import 'package:idwey/widgets/lists/hostListSection.dart';
import 'package:idwey/widgets/tabs/ActivityFilterTab.dart';
import 'package:idwey/widgets/tabs/EventFilterTab.dart';
import 'package:idwey/widgets/tabs/HostFilterTab.dart';

import '../utils/utils.dart';

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
              margin: EdgeInsets.only(left: 15, right: 15, top: 5),
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
            // FORCES SECTION
            Container(
              height: 1200,
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    width: double.infinity,
                    child: ClipPath(
                      clipper: CustomClips(),
                      child: Container(
                        height: 400,
                        color: primary,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 150,
                    child: Container(
                      height: 1150,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(top: 0),
                      color: primary,
                      child: Column(
                        children: [
                          Text(
                            'IDWEY',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Nos 4 points forts ↓',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 15),
                          ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              padding:
                                  MaterialStateProperty.all<EdgeInsetsGeometry>(
                                      EdgeInsets.symmetric(
                                          vertical: 17, horizontal: 27)),
                              elevation: MaterialStateProperty.all<double>(0),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  side: BorderSide(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                ),
                              ),
                            ),
                            child: Text(
                              'Notre Concept',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                              ),
                            ),
                          ),
                          ForcesSectionItem(
                              'Démarche environnementale',
                              'loienv.png',
                              'une réservation = un arbre planté en Tunisie.'),
                          ForcesSectionItem(
                              'Nouvelles formes de tourisme',
                              'tourisme.png',
                              'Nous travaillons sur le développement de nouvelles formes de tourisme, à travers nos ambassadeurs experts tels que le géotourisme et le tourisme d\'aventure.'),
                          ForcesSectionItem(
                              'Expertise locale et sportive',
                              'localisation.png',
                              'IDWEY et ses partenaires locaux mettent à votre disposition des expériences à fortes valeurs ajoutées.'),
                          ForcesSectionItem(
                              'Valorisation territoriale',
                              'evaluation.png',
                              'En mettant l\'accent sur les aspects du développement durable, IDWEY contribue à la valorisation territoriale et l\'intégration des communautés locales.'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // YOUR DESIRES SECTION
            Container(
              margin: EdgeInsets.only(top: 30, left: 15),
              child: Text(
                'La Tunisie selon vos envies',
                style: TextStyle(
                  color: primaryOrange,
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 8, left: 15, right: 15),
              child: Text(
                'Parce que vous êtes différents',
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
                          color: primaryOrange,
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
                          color: primaryOrange,
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
              width: MediaQuery.of(context).size.width,
              height: 300,
              margin: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
              ),
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: Image.asset(
                        'assets/sport.jpg',
                        fit: BoxFit.cover,
                        color: Colors.black.withOpacity(0.4),
                        colorBlendMode: BlendMode.darken,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 145,
                    child: Container(
                      width: MediaQuery.of(context).size.width - 30,
                      child: Center(
                        child: Text(
                          'AVENTURES SPORTIVES',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // DESTINATION SECTION
            Container(
              margin: EdgeInsets.only(top: 30, left: 15),
              child: Text(
                'Destination en vogue',
                style: TextStyle(
                  color: primary,
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 8, left: 15, right: 15),
              child: Text(
                'Choisissez la destination qui vous parle le plus.',
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
              width: MediaQuery.of(context).size.width,
              height: 300,
              margin: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
              ),
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: Image.asset(
                        'assets/beach.jpg',
                        fit: BoxFit.cover,
                        color: Colors.black.withOpacity(0.4),
                        colorBlendMode: BlendMode.darken,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 100,
                    child: Container(
                      width: MediaQuery.of(context).size.width - 30,
                      child: Column(
                        children: [
                          Center(
                            child: Text(
                              'PLAGE',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            padding: EdgeInsets.only(
                                top: 10, bottom: 10, right: 15, left: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: primaryOrange,
                            ),
                            child: Column(
                              children: [
                                Text(
                                  '65 événements',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  '29 hébergements',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  '8 activités',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
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
            Container(
              margin: EdgeInsets.only(top: 20, left: 15),
              child: Text(
                'Avis des cliens',
                style: TextStyle(
                  color: primary,
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 10),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                border: Border.all(
                  color: Colors.grey.shade300,
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(
                            "https://idwey.tn/uploads/0000/1/2020/02/21/4.jpeg"),
                        backgroundColor: Colors.transparent,
                      ),
                      SizedBox(width: 15),
                      Column(
                        children: [
                          Text(
                            'Dorra Bellil',
                            style: TextStyle(
                              color: primary,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.yellow, size: 18),
                              Icon(Icons.star, color: Colors.yellow, size: 18),
                              Icon(Icons.star, color: Colors.yellow, size: 18),
                              Icon(Icons.star, color: Colors.yellow, size: 18),
                              Icon(Icons.star, color: Colors.yellow, size: 18),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 5, top: 10),
                    child: Text(
                      'Réservation facile et efficace, une équipe formidable. Bravo, je n’ai rien d’autre à ajouter.',
                      style: TextStyle(
                        color: grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
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
            Container(
              margin: EdgeInsets.only(top: 30),
              padding: EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width,
              height: 700,
              color: footerBg,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 25),
                  Text(
                    'BESOIN D\'AIDE?',
                    style: TextStyle(
                        color: primary,
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  ),
                  const SizedBox(height: 5),
                  const Divider(),
                  const SizedBox(height: 5),
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        VerticalDivider(
                          width: 20,
                          thickness: 3,
                          color: primaryOrange,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Appelez-nous',
                              style: TextStyle(
                                  color: grey,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
                            ),
                            SizedBox(height: 10),
                            Text(
                              '+216 31 106 666',
                              style: TextStyle(
                                  color: primary,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        VerticalDivider(
                          width: 20,
                          thickness: 3,
                          color: primaryOrange,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Horaire',
                              style: TextStyle(
                                  color: grey,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Lundi -> Vendredi',
                              style: TextStyle(
                                  color: primary,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
                            ),
                            Text(
                              '10:00 -> 18:00',
                              style: TextStyle(
                                  color: primary,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        VerticalDivider(
                          width: 20,
                          thickness: 3,
                          color: primaryOrange,
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Adresse',
                                style: TextStyle(
                                    color: grey,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14),
                              ),
                              SizedBox(height: 10),
                              Container(
                                width: MediaQuery.of(context).size.width - 50,
                                child: Text(
                                  '63 Avenue Habib Bourguiba (Immeuble Le Parnasse), 7ème étage. Tunis, Tunisie',
                                  style: TextStyle(
                                      color: primary,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 35),
                  Text(
                    'EXPLORER',
                    style: TextStyle(
                        color: primary,
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  ),
                  const SizedBox(height: 5),
                  const Divider(),
                  const SizedBox(height: 5),
                  Text(
                    'A propos',
                    style: TextStyle(
                        color: primary,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Devenir partenaire',
                    style: TextStyle(
                        color: primary,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Condition d\'utilisation ',
                    style: TextStyle(
                        color: primary,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Contact',
                    style: TextStyle(
                        color: primary,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'FAQs',
                    style: TextStyle(
                        color: primary,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                  const SizedBox(height: 35),
                  Text(
                    'SUIVEZ NOUS',
                    style: TextStyle(
                        color: primary,
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  ),
                  const SizedBox(height: 5),
                  const Divider(),
                  const SizedBox(height: 5),
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        VerticalDivider(
                          width: 20,
                          thickness: 3,
                          color: primaryOrange,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Suivez nous',
                              style: TextStyle(
                                  color: grey,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
                            ),
                            SizedBox(height: 10),
                            Container(
                              width: 120,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.facebookF,
                                    size: 15,
                                    color: primary,
                                  ),
                                  FaIcon(
                                    FontAwesomeIcons.instagram,
                                    size: 15,
                                    color: primary,
                                  ),
                                  FaIcon(
                                    FontAwesomeIcons.linkedin,
                                    size: 15,
                                    color: primary,
                                  ),
                                  FaIcon(
                                    FontAwesomeIcons.youtube,
                                    size: 15,
                                    color: primary,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
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
                onPressed: () {},
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
