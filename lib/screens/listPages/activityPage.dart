import 'dart:async';

import 'package:another_xlider/another_xlider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:idwey/utils/colors.dart';
import 'package:idwey/widgets/common/scaffold.dart';

import '../../models/activity.dart';
import '../../models/sharedModel.dart';
import '../../services/activityCalls.dart';
import '../../utils/utils.dart';
import '../../widgets/common/filterWidget.dart';
import '../../widgets/common/footer.dart';
import '../../widgets/listItems/activityListItem.dart';
import '../../widgets/tabs/ActivityFilterTab.dart';

class ActivityPage extends StatefulWidget {
  dynamic searchInputs;
  List<String>? cities;

  ActivityPage({Key? key, required this.searchInputs, this.cities})
      : super(key: key);

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  dynamic searchInputs = {'start': '', 'end': '', 'address': '', 'adults': ''};
  dynamic filterInputs = {'min': '', 'max': '', 'terms': [], 'catID': []};
  var posKey = GlobalKey();

  List<Activity> listActivities = [];
  List<Terms> listConvience = [];
  List<Terms> activity_category = [];
  List<Terms> listStyles = [];

  bool loading = false;
  bool showFAB = false;
  int listLengthFromLastCall = 0;
  int total = 0;
  double max = 0;
  double min = 0;
  List<int> terms = [];
  List<int> catID = [];

  double _lowerValue = 0;
  double _upperValue = 0;
  bool _showAllConv = false;
  bool _showAllAct = false;
  bool _showAllStyle = false;
  Timer? _timer;

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

  isExist(int x, bool checked, List<dynamic> list) {
    print(list.contains(x));
    if (checked) {
      if (!list.contains(x)) list.add(x);
    } else {
      if (list.contains(x)) list.remove(x);
    }
  }

  filtredActivities() {
    setState(() {
      loading = true;
    });
    if (listLengthFromLastCall == 0 &&
        (terms.isNotEmpty ||
            catID.isNotEmpty ||
            filterInputs["min"] != "" ||
            filterInputs["max"] != "")) {
      Fluttertoast.showToast(
          backgroundColor: Colors.black.withOpacity(0.8),
          msg: "Filtre appliqué",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          fontSize: 14.0);
    }
    ActivityCalls.getActivityList(
            searchInputs, listActivities.length, filterInputs)
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

  callActivities() {
    setState(() {
      loading = true;
    });
    ActivityCalls.getActivityList(searchInputs, listActivities.length,
        {'min': '', 'max': '', 'terms': [], 'catID': []}).then((result) async {
      setState(() {
        listLengthFromLastCall = result["list"].length;
        listActivities.addAll(result["list"]);
        total = result["total"];
        max = double.parse(result["priceRange"][1]);
        min = double.parse(result["priceRange"][0]);
        _lowerValue = min;
        _upperValue = max;
        if (widget.cities!.isEmpty) {
          widget.cities = result['cities'];
        }
        listConvience = result["listConvenience"];
        activity_category = result["activity_category"];
        listStyles = result["listStyles"];
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
    if (widget.searchInputs != '') {
      searchInputs = widget.searchInputs;
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        Scrollable.ensureVisible(posKey.currentContext!,
            duration: const Duration(seconds: 1), curve: Curves.linear);
      });
    }

    scrollController.addListener(() {
      if ((terms.length == 0 &&
              filterInputs["min"] == "" &&
              filterInputs["max"] == "") &&
          (scrollController.position.pixels + 2000) >=
              scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange &&
          !loading &&
          !(listLengthFromLastCall < 20)) {
        callActivities();
      } else if ((catID.isNotEmpty ||
              terms.isNotEmpty ||
              filterInputs["min"] != "" ||
              filterInputs["max"] != "") &&
          (scrollController.position.pixels + 2000) >=
              scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange &&
          !loading &&
          !(listLengthFromLastCall < 20)) {
        filtredActivities();
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
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: primaryGrey));
    List<Terms> displayedListConvience = [];
    List<Terms> displayedListStyles = [];

    List<Terms> displayedListActivityCategory = [];

    if (listConvience.isNotEmpty && activity_category.isNotEmpty) {
      displayedListConvience =
          _showAllConv ? listConvience : listConvience.sublist(0, 3);
      displayedListActivityCategory =
          _showAllAct ? activity_category : activity_category.sublist(0, 3);
      displayedListStyles =
          _showAllStyle ? listStyles : listStyles.sublist(0, 3);
    }
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
                          cities: widget.cities,
                          scrollController: scrollController,
                          positionKey: posKey,
                          shouldNavigate: false,
                          defaultInputs: searchInputs,
                          onChangeField: (dynamic searchInputs) =>
                              updateSearchFields(searchInputs)),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 0.3, color: grey)),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 15),
                          child: Row(
                            children: [
                              Container(
                                width: 5,
                                height: 20,
                                decoration: BoxDecoration(color: primaryOrange),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Filtrer par'.toUpperCase(),
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: titleBlack),
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                            color: Colors.grey,
                            height: 1,
                            indent: 0,
                            thickness: 0.5),
                        PriceRangeSlider(
                            max: max,
                            min: min,
                            lowerValue: _lowerValue,
                            upperValue: _upperValue,
                            priceRangeChange: (lowerV, upperV) {
                              setState(() {
                                _lowerValue = lowerV;
                                _upperValue = upperV;
                              });
                            },
                            callBack: () {
                              setState(() {
                                filterInputs["min"] =
                                    _lowerValue.toInt().toString();
                                filterInputs["max"] =
                                    _upperValue.toInt().toString();
                                listActivities = [];
                                listLengthFromLastCall = 0;
                              });
                              filtredActivities();
                            }),
                        const Divider(
                            color: Colors.grey,
                            height: 1,
                            indent: 0,
                            thickness: 0.5),
                        FilterTab(
                            title: 'Type de l\'activité',
                            filtringListFunction: (item, value) {
                              setState(() {
                                item.checked = value;
                                isExist(item.id!, value!, catID);
                                filterInputs['catID'] = catID;
                                listActivities = [];
                                listLengthFromLastCall = 0;
                              });
                              _timer?.cancel();

                              _timer = Timer(Duration(seconds: 1), () {
                                // Call your function here
                                filtredActivities();
                              });

                              print(catID.length);
                            },
                            showMoreFunction: () {
                              setState(() {
                                _showAllAct = !_showAllAct;
                              });
                            },
                            displayedList: displayedListActivityCategory,
                            showAllAct: _showAllAct),
                        const Divider(
                            color: Colors.grey,
                            height: 1,
                            indent: 0,
                            thickness: 0.5),
                        FilterTab(
                            title: 'Style',
                            filtringListFunction: (item, value) {
                              setState(() {
                                item.checked = value ?? false;
                                isExist(item.id!, value!, terms);
                                filterInputs['terms'] = terms;
                                listActivities = [];
                                listLengthFromLastCall = 0;
                              });
                              _timer?.cancel();

                              _timer = Timer(Duration(seconds: 1), () {
                                // Call your function here
                                filtredActivities();
                              });
                              print(terms.length);
                            },
                            showMoreFunction: () {
                              setState(() {
                                _showAllStyle = !_showAllStyle;
                              });
                            },
                            displayedList: displayedListStyles,
                            showAllAct: _showAllStyle),
                        const Divider(
                            color: Colors.grey,
                            height: 1,
                            indent: 0,
                            thickness: 0.5),
                        FilterTab(
                            title: 'Commodités',
                            filtringListFunction: (item, value) {
                              setState(() {
                                item.checked = value ?? false;
                                isExist(item.id!, value!, terms);
                                filterInputs['terms'] = terms;
                                listActivities = [];
                                listLengthFromLastCall = 0;
                              });
                              _timer?.cancel();

                              _timer = Timer(Duration(seconds: 1), () {
                                // Call your function here
                                filtredActivities();
                              });
                              print(terms.length);
                            },
                            showMoreFunction: () {
                              setState(() {
                                _showAllConv = !_showAllConv;
                              });
                            },
                            displayedList: displayedListConvience,
                            showAllAct: _showAllConv),
                        Container(
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                listActivities = [];
                                filterInputs = {
                                  'min': '',
                                  'max': '',
                                  'terms': [],
                                  'catID': []
                                };
                              });

                              callActivities();
                            },
                            child: Text('Effacer les filtres'),
                          ),
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      key: posKey,
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
