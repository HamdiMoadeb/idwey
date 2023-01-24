import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:idwey/screens/homePage.dart';
import 'package:idwey/screens/hostPage.dart';
import 'package:idwey/utils/colors.dart';

//common scaffold
class CommonScaffold extends StatefulWidget {
  final Widget body;
  final GlobalKey<ScaffoldState> scaffoldKey;
  const CommonScaffold(
      {Key? key, required this.body, required this.scaffoldKey})
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
      endDrawer: Drawer(
        child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.all(50),
            children: [
              Container(
                child: ListTile(
                    title: const Text('Accueil'),
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ));
                    }),
              ),
              Container(
                child: ListTile(
                    title: const Text('Nos Hébergement'),
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HostPage(),
                          ));
                    }),
              ),
            ]),
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
            widget.scaffoldKey.currentState?.openEndDrawer();
          },
        ),
      ],
    );
  }
}
