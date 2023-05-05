import 'dart:async';

import 'package:another_xlider/another_xlider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:idwey/models/experience.dart';
import 'package:idwey/services/experienceCalls.dart';
import 'package:idwey/utils/colors.dart';
import 'package:idwey/widgets/common/scaffold.dart';
import 'package:idwey/widgets/listItems/experienceListItem.dart';
import 'package:idwey/widgets/tabs/ActivityFilterTab.dart';

import '../../models/sharedModel.dart';
import '../../utils/utils.dart';
import '../../widgets/common/filterWidget.dart';
import '../../widgets/common/footer.dart';

class ExperiencePage extends StatefulWidget {
  const ExperiencePage({Key? key}) : super(key: key);

  @override
  State<ExperiencePage> createState() => _ExperiencePageState();
}

class _ExperiencePageState extends State<ExperiencePage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  List<Experience> listExps = [];
  List<Terms> listConvience = [];
  List<Terms> activity_category = [];

  bool loading = false;
  bool showFAB = false;
  int listLengthFromLastCall = 0;
  int totalNb = 0;
  double max = 0;
  double min = 0;
  List<int> terms = [];
  List<int> catID = [];

  double _lowerValue = 0;
  double _upperValue = 0;

  bool _showAllConv = false;
  bool _showAllAct = false;
  var posKey = GlobalKey();

  dynamic searchInputs = {'start': '', 'end': '', 'address': '', 'adults': ''};
  dynamic filterInputs = {'min': '', 'max': '', 'terms': [], 'catID': []};
  Timer? _timer;

  void updateSearchFields(dynamic searchInputs) {
    setState(() {
      listExps.clear();
      this.searchInputs = searchInputs;
    });
    callExps();
  }

  void scrollToList() {
    scrollController.animateTo(500,
        duration: const Duration(seconds: 2), curve: Curves.linear);
  }

  isExist(int x, bool checked, List<dynamic> list) {
    print(list.contains(x));
    if (checked) {
      if (!list.contains(x)) list.add(x);
    } else {
      if (list.contains(x)) list.remove(x);
    }
  }

  filtredExperience() async {
    setState(() {
      loading = true;
    });
    await ExperienceCalls.getExperienceList(
            searchInputs, listExps.length, filterInputs)
        .then((result) async {
      setState(() {
        listLengthFromLastCall = result["list"].length;
        if (!(listLengthFromLastCall < 20))
          listExps.addAll(result["list"]);
        else
          listExps = result["list"];
        totalNb = result["total"];
        loading = false;
      });
      Fluttertoast.showToast(
          backgroundColor: Colors.black.withOpacity(0.8),
          msg: "Filtre appliqué",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          fontSize: 14.0);
    });
  }

  callExps() {
    setState(() {
      loading = true;
    });
    ExperienceCalls.getExperienceList(searchInputs, listExps.length,
        {'min': '', 'max': '', 'terms': [], 'catID': []}).then((result) async {
      setState(() {
        listLengthFromLastCall = result["list"].length;
        listExps.addAll(result["list"]);
        totalNb = result["total"];
        max = double.parse(result["priceRange"][1]);
        min = double.parse(result["priceRange"][0]);
        filterInputs['min'] = min.toInt().toString();
        filterInputs['max'] = max.toInt().toString();
        _lowerValue = min;
        _upperValue = max;
        listConvience = result["listConvenience"];
        activity_category = result["activity_category"];
      });
      setState(() {
        loading = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();

    checkInternetConnectivity(context, callExps);

    scrollController.addListener(() {
      if (terms.length == 0 && min == 0 && max == 0 && catID.length == 0) {
        if ((scrollController.position.pixels + 2000) >=
                scrollController.position.maxScrollExtent &&
            !scrollController.position.outOfRange &&
            !loading &&
            !(listLengthFromLastCall < 20)) {
          callExps();
        }
      } else {
        if ((scrollController.position.pixels + 2000) >=
                scrollController.position.maxScrollExtent &&
            !scrollController.position.outOfRange &&
            !loading &&
            !(listLengthFromLastCall < 20)) {
          filtredExperience();
        }
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

  void scrollToTop() {
    scrollController.animateTo(0,
        duration: const Duration(seconds: 2), curve: Curves.linear);
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
    List<Terms> displayedListActivityCategory = [];

    if (listConvience.isNotEmpty && activity_category.isNotEmpty) {
      displayedListConvience =
          _showAllConv ? listConvience : listConvience.sublist(0, 3);
      displayedListActivityCategory =
          _showAllAct ? activity_category : activity_category.sublist(0, 3);
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
                          child: Image.asset("assets/experienceCover.jpg",
                              fit: BoxFit.cover),
                        ),
                      ),
                      Positioned.fill(
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Circuits et Expériences',
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
                    child: ActivityFilterTab(
                      scrollController: scrollController,
                      shouldNavigate: false,
                      positionKey: posKey,
                      defaultInputs: searchInputs,
                      onChangeField: (dynamic searchInputs) =>
                          updateSearchFields(searchInputs),
                    ),
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
                              listExps = [];
                              listLengthFromLastCall = 0;
                            });
                            filtredExperience();
                          }),
                      const Divider(
                          color: Colors.grey,
                          height: 1,
                          indent: 0,
                          thickness: 0.5),
                      FilterTab(
                          title: 'Type de l\'expérience',
                          filtringListFunction: (item, value) {
                            setState(() {
                              item.checked = value ?? false;
                              isExist(item.id!, value!, catID);
                              filterInputs['catID'] = catID;
                              listExps = [];
                              listLengthFromLastCall = 0;
                            });
                            _timer?.cancel();

                            _timer = Timer(Duration(seconds: 1), () {
                              // Call your function here
                              filtredExperience();
                            });
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
                          title: 'Commodités',
                          filtringListFunction: (item, value) {
                            setState(() {
                              item.checked = value;
                              isExist(item.id!, value!, terms);
                              filterInputs['terms'] = terms;
                              listExps = [];
                              listLengthFromLastCall = 0;
                            });
                            _timer?.cancel();

                            _timer = Timer(Duration(seconds: 1), () {
                              // Call your function here
                              filtredExperience();
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
                              listExps = [];

                              filterInputs = {
                                'min': '',
                                'max': '',
                                'terms': [],
                                'catID': []
                              };
                            });

                            callExps();
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
                      "${totalNb} expériences trouvés",
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
                      child: ExperienceListItem(listExps[index])),
                  itemCount: listExps.length,
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
