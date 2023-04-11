import 'package:another_xlider/another_xlider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:idwey/models/experience.dart';
import 'package:idwey/services/experienceCalls.dart';
import 'package:idwey/utils/colors.dart';
import 'package:idwey/widgets/common/scaffold.dart';
import 'package:idwey/widgets/listItems/experienceListItem.dart';
import 'package:idwey/widgets/tabs/ActivityFilterTab.dart';

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
  double _lowerValue = 0;
  double _upperValue = 0;

  bool _showAllConv = false;
  bool _showAllAct = false;

  dynamic searchInputs = {'start': '', 'end': '', 'address': '', 'adults': ''};
  dynamic filterInputs = {'min': '', 'max': '', 'terms': []};

  void updateSearchFields(dynamic searchInputs) {
    setState(() {
      listExps.clear();
      this.searchInputs = searchInputs;
    });
    callExps();
  }

  isExist(int x, bool checked) {
    print(terms.contains(x));
    if (checked) {
      if (!terms.contains(x)) terms.add(x);
    } else {
      if (terms.contains(x)) terms.remove(x);
    }
  }

  filtredExperience() {
    setState(() {
      loading = true;
    });
    ExperienceCalls.getExperienceList(
            searchInputs, listExps.length, filterInputs)
        .then((result) async {
      setState(() {
        listLengthFromLastCall = result["list"].length;
        listExps.addAll(result["list"]);
        totalNb = result["total"];
      });
      await Future.delayed(Duration(seconds: 1));
      setState(() {
        loading = false;
      });
    });
  }

  callExps() {
    setState(() {
      loading = true;
    });
    ExperienceCalls.getExperienceList(
            searchInputs, listExps.length, {'min': '', 'max': '', 'terms': []})
        .then((result) async {
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
      await Future.delayed(Duration(seconds: 1));
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
      if (terms.length == 0 && min == 0 && max == 0) {
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
          callExps();
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
                      Theme(
                          data: Theme.of(context)
                              .copyWith(dividerColor: Colors.transparent),
                          child: ExpansionTile(
                              expandedCrossAxisAlignment:
                                  CrossAxisAlignment.start,
                              expandedAlignment: Alignment.topLeft,
                              collapsedTextColor: titleBlack,
                              textColor: titleBlack,
                              childrenPadding: EdgeInsets.zero,
                              title: Text(
                                'Filtrer par prix',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      top: 10, left: 20, right: 20, bottom: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      FlutterSlider(
                                        values: [_lowerValue, _upperValue],
                                        max: max,
                                        min: min,
                                        trackBar: FlutterSliderTrackBar(
                                            inactiveTrackBarHeight: 12,
                                            activeTrackBarHeight: 12,
                                            activeTrackBar: BoxDecoration(
                                                color: primaryOrange),
                                            inactiveTrackBar: BoxDecoration(
                                                color: secondaryGrey,
                                                borderRadius:
                                                    BorderRadius.circular(3))),
                                        handler: FlutterSliderHandler(
                                          decoration: BoxDecoration(),
                                          child: Material(
                                            type: MaterialType.canvas,
                                            color: primaryOrange,
                                            elevation: 0,
                                            child: SizedBox(
                                              width: 2,
                                              height: 16,
                                            ),
                                          ),
                                        ),
                                        rightHandler: FlutterSliderHandler(
                                          decoration: BoxDecoration(),
                                          child: Material(
                                            type: MaterialType.canvas,
                                            color: primaryOrange,
                                            elevation: 0,
                                            child: SizedBox(
                                              width: 2,
                                              height: 16,
                                            ),
                                          ),
                                        ),
                                        rangeSlider: true,
                                        handlerAnimation:
                                            FlutterSliderHandlerAnimation(
                                          curve: Curves.elasticOut,
                                          reverseCurve: null,
                                          duration: Duration(milliseconds: 700),
                                        ),
                                        tooltip: FlutterSliderTooltip(
                                            leftPrefix: Text(
                                              'DT ',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            rightPrefix: Text(
                                              'DT ',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            alwaysShowTooltip: true,
                                            textStyle: TextStyle(
                                                fontSize: 11,
                                                color: Colors.white),
                                            boxStyle: FlutterSliderTooltipBox(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color: primaryOrange)),
                                            positionOffset:
                                                FlutterSliderTooltipPositionOffset(
                                                    top: -10)),
                                        hatchMark: FlutterSliderHatchMark(
                                          density: 0.2,
                                          smallDensity: 2,
                                          linesDistanceFromTrackBar: 2,
                                          displayLines: true,
                                          labelsDistanceFromTrackBar: 55,
                                          labels: [
                                            FlutterSliderHatchMarkLabel(
                                                percent: 0,
                                                label: Text(
                                                  removeDecimalZeroFormat(
                                                      '$min'),
                                                  style: TextStyle(
                                                      fontSize: 9, color: grey),
                                                )),
                                            FlutterSliderHatchMarkLabel(
                                                percent: 25,
                                                label: Text(
                                                    removeDecimalZeroFormat(
                                                        '${(max - min) * 0.25}'),
                                                    style: TextStyle(
                                                        fontSize: 9,
                                                        color: grey))),
                                            FlutterSliderHatchMarkLabel(
                                                percent: 50,
                                                label: Text(
                                                    removeDecimalZeroFormat(
                                                        '${(max - min) * 0.5}'),
                                                    style: TextStyle(
                                                        fontSize: 9,
                                                        color: grey))),
                                            FlutterSliderHatchMarkLabel(
                                                percent: 75,
                                                label: Text(
                                                    removeDecimalZeroFormat(
                                                        '${(max - min) * 0.75}'),
                                                    style: TextStyle(
                                                        fontSize: 9,
                                                        color: grey))),
                                            FlutterSliderHatchMarkLabel(
                                                percent: 100,
                                                label: Text(
                                                    removeDecimalZeroFormat(
                                                        '$max'),
                                                    style: TextStyle(
                                                        fontSize: 9,
                                                        color: grey))),
                                          ],
                                        ),
                                        onDragging: (handlerIndex, lowerValue,
                                            upperValue) {
                                          setState(() {
                                            _lowerValue = lowerValue;
                                            _upperValue = upperValue;
                                          });
                                        },
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            setState(() {
                                              filterInputs["min"] = _lowerValue
                                                  .toInt()
                                                  .toString();
                                              filterInputs["max"] = _upperValue
                                                  .toInt()
                                                  .toString();
                                              listExps = [];
                                              listLengthFromLastCall = 0;
                                            });
                                            filtredExperience();
                                          },
                                          child: Text(
                                            'Appliquer',
                                            style: TextStyle(
                                                color: primaryOrange,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14),
                                          ))
                                    ],
                                  ),
                                ),
                              ])),
                      const Divider(
                          color: Colors.grey,
                          height: 1,
                          indent: 0,
                          thickness: 0.5),
                      FilterTab(
                          filtringListFunction: () {},
                          showMoreFunction: () {
                            setState(() {
                              _showAllAct = !_showAllAct;
                            });
                          },
                          displayedList: displayedListActivityCategory,
                          showAllAct: _showAllAct),
                      Theme(
                          data: Theme.of(context)
                              .copyWith(dividerColor: Colors.transparent),
                          child: ExpansionTile(
                              expandedCrossAxisAlignment:
                                  CrossAxisAlignment.start,
                              expandedAlignment: Alignment.topLeft,
                              collapsedTextColor: titleBlack,
                              textColor: titleBlack,
                              childrenPadding: EdgeInsets.zero,
                              title: Text(
                                'Type de l\'expérience',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                              children: [
                                Column(children: [
                                  ...displayedListActivityCategory.map(
                                    (item) => CheckboxListTile(
                                      title: Text(item.name!),
                                      value: item.checked,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          item.checked = value ?? false;
                                          isExist(item.id!, value!);
                                          filterInputs['terms'] = terms;
                                          listExps = [];
                                          listLengthFromLastCall = 0;
                                        });
                                        filtredExperience();
                                        print(terms.length);
                                      },
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        _showAllAct = !_showAllAct;
                                      });
                                    },
                                    child:
                                        Text(!_showAllAct ? 'Plus' : 'Moins'),
                                  ),
                                ])
                              ])),
                      const Divider(
                          color: Colors.grey,
                          height: 1,
                          indent: 0,
                          thickness: 0.5),
                      Theme(
                        data: Theme.of(context).copyWith(
                          dividerColor: Colors.transparent,
                        ),
                        child: ExpansionTile(
                            expandedCrossAxisAlignment:
                                CrossAxisAlignment.start,
                            expandedAlignment: Alignment.topLeft,
                            collapsedTextColor: titleBlack,
                            textColor: titleBlack,
                            childrenPadding: EdgeInsets.zero,
                            title: Text(
                              'Commodités',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                            children: [
                              Column(children: [
                                ...displayedListConvience.map(
                                  (item) => CheckboxListTile(
                                    title: Text(item.name!),
                                    value: item.checked,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        item.checked = value ?? false;
                                        isExist(item.id!, value!);
                                        filterInputs['terms'] = terms;
                                        listExps = [];
                                        listLengthFromLastCall = 0;
                                      });
                                      filtredExperience();
                                      print(terms.length);
                                    },
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      _showAllConv = !_showAllConv;
                                    });
                                  },
                                  child: Text(!_showAllConv ? 'plus' : 'Moins'),
                                )
                              ])
                            ]),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
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
