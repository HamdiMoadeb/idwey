import 'package:flutter/material.dart';
import 'package:idwey/utils/colors.dart';
import 'package:idwey/widgets/common/scaffold.dart';
import 'package:flutter/services.dart';

import '../models/host.dart';
import '../services/hostCalls.dart';
import '../widgets/common/footer.dart';
import '../widgets/listItems/hostListItem.dart';
import '../widgets/tabs/HostFilterTab.dart';

class HostPage extends StatefulWidget {
  const HostPage({Key? key}) : super(key: key);

  @override
  State<HostPage> createState() => _HostPageState();
}

class _HostPageState extends State<HostPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  int page = 1;
  int totalPages = 1;
  List<Host> hosts = [];
  int hostsCount = 0;
  bool hasReachPoint = false;
  getAllHosts(page) {
    HostCalls.getHostsList(page).then((data) {
      setState(() {
        hosts += data['hosts'];
        hostsCount = data['total'];
        totalPages = data['last_page'];
        hasReachPoint = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_scrollListner);
    getAllHosts(page);
  }

  void _scrollListner() {
    if (scrollController.position.pixels.toInt() >=
            scrollController.position.maxScrollExtent.toInt() - 1500 &&
        hasReachPoint == false &&
        page < totalPages) {
      setState(() {
        hasReachPoint = true;
        page = page + 1;
        getAllHosts(page);
      });
    }
    ;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: primaryGrey));
    return CommonScaffold(
      scaffoldKey: _scaffoldKey,
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Stack(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 230,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Image.asset("assets/hostPageCover.jpg",
                              fit: BoxFit.cover),
                        ),
                      ),
                      const Positioned(
                        top: 90.0,
                        left: 20,
                        child: Text(
                          'Nos hébergements',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 34,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 180),
                    child: HostFilterTab(),
                  ),
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "$hostsCount hébergements trouvés",
                style: TextStyle(
                  fontSize: 24.0,
                  color: titleBlue,
                ),
              ),
            ),
            HostList(hosts: hosts),
            //footer
            Footer(),
            CreatedBy(),
            BackToTop(),
          ],
        ),
      ),
    );
  }
}

class HostList extends StatefulWidget {
  final List<Host> hosts;
  const HostList({Key? key, required this.hosts}) : super(key: key);

  @override
  State<HostList> createState() => _HostListState();
}

class _HostListState extends State<HostList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        for (var i = 0; i < widget.hosts.length; i++)
          Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: HostListItem(widget.hosts[i]))
      ],
    );
  }
}
