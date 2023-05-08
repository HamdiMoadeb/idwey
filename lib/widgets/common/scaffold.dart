import 'package:flag/flag.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:idwey/screens/authPages/RegisterPage.dart';
import 'package:idwey/screens/homePage.dart';
import 'package:idwey/screens/listPages/activityPage.dart';
import 'package:idwey/screens/listPages/eventPage.dart';
import 'package:idwey/screens/listPages/experiencePage.dart';
import 'package:idwey/screens/listPages/hostPage.dart';
import 'package:idwey/screens/listPages/productPage.dart';
import 'package:idwey/utils/colors.dart';

import '../../screens/authPages/loginPage.dart';
import '../../screens/listPages/blogPage.dart';

//common scaffold
class CommonScaffold extends StatefulWidget {
  final Widget body;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final Function backtotop;
  final bool showFab;
  CommonScaffold(
      {Key? key,
      required this.body,
      required this.scaffoldKey,
      required this.showFab,
      required this.backtotop})
      : super(key: key);

  @override
  State<CommonScaffold> createState() => _CommonScaffoldState();
}

class _CommonScaffoldState extends State<CommonScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: widget.scaffoldKey,
      backgroundColor: Colors.white,
      drawerEnableOpenDragGesture: false,
      endDrawerEnableOpenDragGesture: true,
      body: widget.body,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: DrawerWidget(
          scaffoldKey: widget.scaffoldKey,
        ),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: widget.showFab
          ? FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: () {
                widget.backtotop();
              },
              child: FaIcon(
                FontAwesomeIcons.anglesUp,
                color: primaryOrange,
                size: 20,
              ),
            )
          : Container(),
      //floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      drawer: Drawer(
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              margin: EdgeInsets.only(top: 30, bottom: 20),
              color: primary,
              height: 45,
              padding: EdgeInsets.only(right: 10),
              child: Row(
                children: [
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_circle_left_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
            //commented to deploy
            // Container(
            //   margin: EdgeInsets.only(left: 10, top: 10),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       TextButton(
            //         onPressed: () {
            //           Navigator.push(
            //               context,
            //               MaterialPageRoute(
            //                 builder: (context) => const LoginPage(),
            //               ));
            //         },
            //         style: ButtonStyle(
            //             tapTargetSize: MaterialTapTargetSize.shrinkWrap),
            //         child: Text(
            //           'Se connecter',
            //           style: TextStyle(
            //             fontSize: 15,
            //             fontWeight: FontWeight.w500,
            //           ),
            //         ),
            //       ),
            //       TextButton(
            //         onPressed: () {
            //           Navigator.push(
            //               context,
            //               MaterialPageRoute(
            //                 builder: (context) => RegisterPage(),
            //               ));
            //         },
            //         style: ButtonStyle(
            //             tapTargetSize: MaterialTapTargetSize.shrinkWrap),
            //         child: Text(
            //           'S\'inscrire',
            //           style: TextStyle(
            //             fontSize: 15,
            //             fontWeight: FontWeight.w500,
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            //comented to deploy
            // Divider(color: Colors.grey, height: 1),
            // Theme(
            //   data:
            //       Theme.of(context).copyWith(dividerColor: Colors.transparent),
            //   child: ExpansionTile(
            //     expandedCrossAxisAlignment: CrossAxisAlignment.start,
            //     expandedAlignment: Alignment.topLeft,
            //     collapsedTextColor: primary,
            //     textColor: primary,
            //     childrenPadding: EdgeInsets.zero,
            //     title: Text(
            //       'TND',
            //       style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            //     ),
            //     children: [
            //       Row(
            //         children: [
            //           SizedBox(width: 30),
            //           TextButton.icon(
            //             onPressed: () {},
            //             icon: Icon(
            //               Icons.arrow_right_alt,
            //               color: Colors.black,
            //             ),
            //             style: ButtonStyle(
            //                 tapTargetSize: MaterialTapTargetSize.shrinkWrap),
            //             label: Text(
            //               'EUR',
            //               style: TextStyle(
            //                 fontSize: 14,
            //                 fontWeight: FontWeight.w500,
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //       Row(
            //         children: [
            //           SizedBox(width: 30),
            //           TextButton.icon(
            //             onPressed: () {},
            //             icon: Icon(
            //               Icons.arrow_right_alt,
            //               color: Colors.black,
            //             ),
            //             style: ButtonStyle(
            //                 tapTargetSize: MaterialTapTargetSize.shrinkWrap),
            //             label: Text(
            //               'USD',
            //               style: TextStyle(
            //                 fontSize: 14,
            //                 fontWeight: FontWeight.w500,
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
            // Divider(color: Colors.grey, height: 2),
            // Theme(
            //   data:
            //       Theme.of(context).copyWith(dividerColor: Colors.transparent),
            //   child: ExpansionTile(
            //     expandedCrossAxisAlignment: CrossAxisAlignment.start,
            //     expandedAlignment: Alignment.topLeft,
            //     collapsedTextColor: primary,
            //     textColor: primary,
            //     childrenPadding: EdgeInsets.zero,
            //     title: Row(
            //       children: [
            //         Flag.fromCode(
            //           FlagsCode.FR,
            //           height: 15,
            //           width: 20,
            //           fit: BoxFit.fill,
            //         ),
            //         SizedBox(width: 5),
            //         Text(
            //           'Français',
            //           style:
            //               TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            //         ),
            //       ],
            //     ),
            //     children: [
            //       Row(
            //         children: [
            //           SizedBox(width: 30),
            //           TextButton.icon(
            //             onPressed: () {},
            //             icon: Icon(
            //               Icons.arrow_right_alt,
            //               color: Colors.black,
            //             ),
            //             style: ButtonStyle(
            //                 tapTargetSize: MaterialTapTargetSize.shrinkWrap),
            //             label: Row(
            //               children: [
            //                 Flag.fromCode(
            //                   FlagsCode.GB,
            //                   height: 15,
            //                   width: 20,
            //                   fit: BoxFit.fill,
            //                 ),
            //                 SizedBox(width: 5),
            //                 Text(
            //                   'English',
            //                   style: TextStyle(
            //                     fontSize: 14,
            //                     fontWeight: FontWeight.w500,
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
            // const Divider(color: Colors.grey, height: 2, thickness: 0.5),
            Row(
              children: [
                SizedBox(width: 10),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HostPage(
                            searchInputs: '',
                            cities: [],
                          ),
                        ));
                  },
                  style: ButtonStyle(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                  child: Text(
                    'Hébergements',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(
                color: Colors.grey,
                height: 2,
                indent: 20,
                endIndent: 20,
                thickness: 0.5),
            Row(
              children: [
                SizedBox(width: 10),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EventPage(
                            searchInputs: '',
                            cities: [],
                            listLocations: [],
                          ),
                        ));
                  },
                  style: ButtonStyle(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                  child: Text(
                    'Événements',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(
                color: Colors.grey,
                height: 2,
                indent: 20,
                endIndent: 20,
                thickness: 0.5),
            Row(
              children: [
                SizedBox(width: 10),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ExperiencePage(),
                        ));
                  },
                  style: ButtonStyle(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                  child: Text(
                    'Circuits et Expériences',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(
                color: Colors.grey,
                height: 1,
                indent: 20,
                endIndent: 20,
                thickness: 0.5),
            Row(
              children: [
                SizedBox(width: 10),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ActivityPage(
                            searchInputs: '',
                            cities: [],
                          ),
                        ));
                  },
                  style: ButtonStyle(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                  child: Text(
                    'Atelier et Activités',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(
                color: Colors.grey,
                height: 1,
                indent: 20,
                endIndent: 20,
                thickness: 0.5),
            Row(
              children: [
                SizedBox(width: 10),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductPage(),
                        ));
                  },
                  style: ButtonStyle(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                  child: Text(
                    'Produits',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            // Theme(
            //   data:
            //       Theme.of(context).copyWith(dividerColor: Colors.transparent),
            //   child: ExpansionTile(
            //     expandedCrossAxisAlignment: CrossAxisAlignment.start,
            //     expandedAlignment: Alignment.topLeft,
            //     collapsedTextColor: primary,
            //     textColor: primary,
            //     childrenPadding: EdgeInsets.zero,
            //     title: Text(
            //       'Nos Services',
            //       style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            //     ),
            //     children: [
            //       const Divider(
            //           color: Colors.grey,
            //           height: 1,
            //           indent: 20,
            //           endIndent: 20,
            //           thickness: 0.5),
            //     ],
            //   ),
            // ),
            const Divider(
                color: Colors.grey,
                height: 1,
                indent: 20,
                endIndent: 20,
                thickness: 0.5),
            //commented to deploy
            // Row(
            //   children: [
            //     SizedBox(width: 10),
            //     TextButton(
            //       onPressed: () {},
            //       style: ButtonStyle(
            //           tapTargetSize: MaterialTapTargetSize.shrinkWrap),
            //       child: Text(
            //         'Qui sommes nous ?',
            //         style: TextStyle(
            //           fontSize: 14,
            //           fontWeight: FontWeight.w500,
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            const Divider(
                color: Colors.grey,
                height: 1,
                indent: 20,
                endIndent: 20,
                thickness: 0.5),
            Row(
              children: [
                SizedBox(width: 10),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlogPage(),
                        ));
                  },
                  style: ButtonStyle(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                  child: Text(
                    'Inspirations',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            // const Divider(
            //     color: Colors.grey,
            //     height: 2,
            //     indent: 20,
            //     endIndent: 20,
            //     thickness: 0.5),
            //commented to deploy
            // Row(
            //   children: [
            //     SizedBox(width: 10),
            //     TextButton(
            //       onPressed: () {},
            //       style: ButtonStyle(
            //           tapTargetSize: MaterialTapTargetSize.shrinkWrap),
            //       child: Text(
            //         'Assurance',
            //         style: TextStyle(
            //           fontSize: 14,
            //           fontWeight: FontWeight.w500,
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            // const Divider(
            //     color: Colors.grey,
            //     height: 1,
            //     indent: 20,
            //     endIndent: 20,
            //     thickness: 0.5),
          ]),
        ),
      ),
    );
  }
}

//common app bar
class DrawerWidget extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const DrawerWidget({Key? key, required this.scaffoldKey}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 2,
      automaticallyImplyLeading: false,
      leadingWidth: 0,
      backgroundColor: primaryGrey,
      title: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ));
        },
        child: SizedBox(
          width: 150,
          height: 50,
          child: Image.asset('assets/logoidwey.png'),
        ),
      ),
      leading: Container(),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.menu_rounded,
            size: 30,
          ),
          onPressed: () {
            widget.scaffoldKey.currentState?.openDrawer();
          },
        ),
      ],
    );
  }
}
