import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:idwey/utils/colors.dart';
import 'package:idwey/widgets/common/scaffold.dart';

import '../models/activity.dart';
import '../services/activityCalls.dart';
import '../utils/utils.dart';
import '../widgets/common/footer.dart';
import '../widgets/listItems/activityListItem.dart';
import '../widgets/tabs/ActivityFilterTab.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({Key? key}) : super(key: key);

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  dynamic searchInputs = {'start': '', 'end': '', 'address': '', 'adults': ''};
  List<Activity> listActivities = [];
  bool loading = false;
  bool showFAB = false;
  int listLengthFromLastCall = 0;
  int total = 0;

  void scrollToTop() {
    scrollController.animateTo(0,
        duration: const Duration(seconds: 2), curve: Curves.linear);
  }

  void updateSearchFields(dynamic searchInputs) {
    setState(() {
      listActivities.clear();
      this.searchInputs = searchInputs;
    });
    callActivities();
  }

  callActivities() {
    setState(() {
      loading = true;
    });
    ActivityCalls.getActivityList(searchInputs, listActivities.length)
        .then((result) async {
      setState(() {
        listLengthFromLastCall = result["list"].length;
        listActivities.addAll(result["list"]);
        total = result["total"];
      });
      await Future.delayed(Duration(seconds: 1));
      setState(() {
        loading = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    checkInternetConnectivity(context, callActivities);

    scrollController.addListener(() {
      if ((scrollController.position.pixels + 2000) >=
              scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange &&
          !loading &&
          !(listLengthFromLastCall < 20)) {
        callActivities();
      }

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
    });
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
              Container(
                child: Stack(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 230,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Image.asset("assets/activitycover.jpg",
                                fit: BoxFit.cover),
                          ),
                        ),
                        const Positioned.fill(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Ateliers et activités',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 180),
                      child: ActivityFilterTab(
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
                        "${total} activités trouvés",
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
                        child: ActivityListItem(listActivities[index])),
                    itemCount: listActivities.length,
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
            ]),
      ),
    );
  }
}
