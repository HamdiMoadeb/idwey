import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:idwey/utils/colors.dart';
import 'package:idwey/widgets/common/scaffold.dart';

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
  List<Host> listHosts = [];
  bool loading = false;
  int listLengthFromLastCall = 0;

  dynamic searchInputs = {'start': '', 'end': '', 'address': '', 'adults': ''};

  void updateSearchFields(dynamic searchInputs) {
    setState(() {
      listHosts.clear();
      this.searchInputs = searchInputs;
    });
    callHosts();
  }

  callHosts() {
    setState(() {
      loading = true;
    });
    HostCalls.getHostsList(searchInputs, listHosts.length).then((list) {
      setState(() {
        loading = false;
        listLengthFromLastCall = list.length;
        listHosts.addAll(list);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    callHosts();

    scrollController.addListener(() {
      if ((scrollController.position.pixels + 1700) >=
              scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange &&
          !loading &&
          !(listLengthFromLastCall < 20)) {
        callHosts();
      }
    });
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
                      Positioned.fill(
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Logements et maisons \nd\'hôtes',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 180),
                    child: HostFilterTab(
                      onChangeField: (dynamic searchInputs) =>
                          updateSearchFields(searchInputs),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "${listHosts.length} hébergements trouvés",
                      style: TextStyle(
                        fontSize: 24.0,
                        color: titleBlue,
                      ),
                    ),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) => Container(
                      margin: EdgeInsets.only(bottom: 15, right: 15),
                      child: HostListItem(listHosts[index], false)),
                  itemCount: listHosts.length,
                ),
              ],
            ),
            loading
                ? Container(
                    margin: EdgeInsets.only(top: 30),
                    child: Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(primary),
                      ),
                    ),
                  )
                : Container(),
            //footer
            Footer(),
            CreatedBy(),
            BackToTop(scrollToTop),
          ],
        ),
      ),
    );
  }
}
