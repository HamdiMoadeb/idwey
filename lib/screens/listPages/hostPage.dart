import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:idwey/utils/colors.dart';
import 'package:idwey/widgets/common/scaffold.dart';
import 'package:another_xlider/another_xlider.dart';

import '../../models/host.dart';
import '../../services/hostCalls.dart';
import '../../utils/utils.dart';
import '../../widgets/common/footer.dart';
import '../../widgets/listItems/hostListItem.dart';
import '../../widgets/tabs/HostFilterTab.dart';

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
  List<Terms> listConvience = [];
  List<Terms> listHotelService = [];
  List<Terms> listPropertyType = [];
  List<int> terms = [];
  bool loading = false;
  bool showFAB = false;
  int listLengthFromLastCall = 0;
  int totalNb = 0;
  double max = 0;
  double min = 0;
  double _lowerValue = 0;
  double _upperValue = 0;

  bool _showAllConv = false;
  bool _showAllProp = false;
  bool _showAllHotel = false;
  dynamic searchInputs = {'start': '', 'end': '', 'address': '', 'adults': ''};
  dynamic filterInputs = {'min': '', 'max': '', 'terms': []};

  void updateSearchFields(dynamic searchInputs) {
    setState(() {
      listHosts.clear();
      this.searchInputs = searchInputs;
    });
    callHosts();
  }

  isExist(int x, bool checked) {
    print(terms.contains(x));
    if (checked) {
      if (!terms.contains(x)) terms.add(x);
    } else {
      if (terms.contains(x)) terms.remove(x);
    }
  }

  filtredHosts() {
    setState(() {
      loading = true;
    });
    HostCalls.getHostsList(searchInputs, listHosts.length, filterInputs)
        .then((result) async {
      setState(() {
        listLengthFromLastCall = result["list"].length;
        listHosts.addAll(result["list"]);
        totalNb = result["total"];
      });
      await Future.delayed(Duration(seconds: 1));
      setState(() {
        loading = false;
      });
    });
  }

  callHosts() {
    setState(() {
      loading = true;
    });
    HostCalls.getHostsList(
            searchInputs, listHosts.length, {'min': '', 'max': '', 'terms': []})
        .then((result) async {
      setState(() {
        listLengthFromLastCall = result["list"].length;
        listHosts.addAll(result["list"]);
        totalNb = result["total"];
        max = double.parse(result["priceRange"][1]);
        min = double.parse(result["priceRange"][0]);
        filterInputs['min'] = min.toInt().toString();
        filterInputs['max'] = max.toInt().toString();
        _lowerValue = min;
        _upperValue = max;
        listConvience = result["listConvenience"];
        listHotelService = result["listHotelService"];
        listPropertyType = result["listPropertyType"];
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

    checkInternetConnectivity(context, callHosts);

    scrollController.addListener(() {
      print(min);
      if (terms.length == 0 && min == 0 && max == 0) {
        if ((scrollController.position.pixels + 2000) >=
                scrollController.position.maxScrollExtent &&
            !scrollController.position.outOfRange &&
            !loading &&
            !(listLengthFromLastCall < 20)) {
          callHosts();
        }
      } else {
        if ((scrollController.position.pixels + 2000) >=
                scrollController.position.maxScrollExtent &&
            !scrollController.position.outOfRange &&
            !loading &&
            !(listLengthFromLastCall < 20)) {
          filtredHosts();
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
    List<Terms> displayedListHotelService = [];
    List<Terms> displayedListPropertyType = [];

    if (listConvience.isNotEmpty &&
        listHotelService.isNotEmpty &&
        listPropertyType.isNotEmpty) {
      displayedListConvience =
          _showAllConv ? listConvience : listConvience.sublist(0, 3);
      displayedListHotelService =
          _showAllHotel ? listHotelService : listHotelService.sublist(0, 3);
      displayedListPropertyType =
          _showAllProp ? listPropertyType : listPropertyType.sublist(0, 3);
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
                                              listHosts = [];
                                              listLengthFromLastCall = 0;
                                            });
                                            filtredHosts();
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
                                'Type de propriété',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                              children: [
                                Column(children: [
                                  ...displayedListPropertyType.map(
                                    (item) => CheckboxListTile(
                                      title: Text(item.name!),
                                      value: item.checked,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          item.checked = value ?? false;
                                          isExist(item.id!, value!);
                                          filterInputs['terms'] = terms;
                                          listHosts = [];
                                          listLengthFromLastCall = 0;
                                        });
                                        filtredHosts();
                                        print(terms.length);
                                      },
                                    ),
                                  ),
                                  if (!_showAllProp)
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          _showAllProp = !_showAllProp;
                                        });
                                      },
                                      child: Text(!_showAllProp
                                          ? 'See more'
                                          : 'See less'),
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
                                        listHosts = [];
                                        listLengthFromLastCall = 0;
                                      });
                                      filtredHosts();
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
                                  child: Text(
                                      !_showAllConv ? 'See more' : 'See less'),
                                )
                              ])
                            ]),
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
                                'Host Service',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                              children: [
                                Column(children: [
                                  ...displayedListHotelService.map(
                                    (item) => CheckboxListTile(
                                      title: Text(item.name!),
                                      value: item.checked,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          item.checked = value ?? false;
                                          isExist(item.id!, value!);
                                          filterInputs['terms'] = terms;
                                          listHosts = [];
                                          listLengthFromLastCall = 0;
                                        });
                                        filtredHosts();
                                        print(terms.length);
                                      },
                                    ),
                                  ),
                                  if (!_showAllHotel)
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          _showAllHotel = !_showAllHotel;
                                        });
                                      },
                                      child: Text(!_showAllHotel
                                          ? 'See more'
                                          : 'See less'),
                                    ),
                                ])
                              ])),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "${totalNb} hébergements trouvés",
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
