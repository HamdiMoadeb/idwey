import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:idwey/utils/colors.dart';
import 'package:idwey/widgets/common/scaffold.dart';

import '../../models/host.dart';
import '../../models/sharedModel.dart';
import '../../services/hostCalls.dart';
import '../../utils/utils.dart';
import '../../widgets/common/filterWidget.dart';
import '../../widgets/common/footer.dart';
import '../../widgets/listItems/hostListItem.dart';
import '../../widgets/tabs/HostFilterTab.dart';

class HostPage extends StatefulWidget {
  dynamic searchInputs;

  HostPage({
    Key? key,
    required this.searchInputs,
  }) : super(key: key);

  @override
  State<HostPage> createState() => _HostPageState();
}

class _HostPageState extends State<HostPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  var posKey = GlobalKey();

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
  Timer? _timer;

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
        if (!(listLengthFromLastCall < 20))
          listHosts.addAll(result["list"]);
        else
          listHosts = result["list"];
        totalNb = result["total"];
        loading = false;
        Fluttertoast.showToast(
            backgroundColor: Colors.black.withOpacity(0.8),
            msg: "Filtre appliqué",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            textColor: Colors.white,
            fontSize: 14.0);
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
        searchInputs = result["searchInputs"];
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
    if (widget.searchInputs != '') searchInputs = widget.searchInputs;

    print(searchInputs["address"]);
    scrollController.addListener(() {
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
  void dispose() {
    _timer?.cancel();
    super.dispose();
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
                      positionKey: posKey,
                      scrollController: scrollController,
                      shouldNavigate: false,
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
                              listHosts = [];
                              listLengthFromLastCall = 0;
                            });
                            filtredHosts();
                          }),
                      const Divider(
                          color: Colors.grey,
                          height: 1,
                          indent: 0,
                          thickness: 0.5),
                      FilterTab(
                          title: 'Type de propriété',
                          filtringListFunction: (item, value) {
                            setState(() {
                              item.checked = value ?? false;
                              isExist(item.id!, value!);
                              filterInputs['terms'] = terms;
                              listHosts = [];
                              listLengthFromLastCall = 0;
                            });
                            _timer?.cancel();

                            _timer = Timer(Duration(seconds: 1), () {
                              // Call your function here
                              filtredHosts();
                            });

                            print(terms.length);
                          },
                          showMoreFunction: () {
                            setState(() {
                              _showAllProp = !_showAllProp;
                            });
                          },
                          displayedList: displayedListPropertyType,
                          showAllAct: _showAllProp),
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
                              isExist(item.id!, value!);
                              filterInputs['terms'] = terms;
                              listHosts = [];
                              listLengthFromLastCall = 0;
                            });
                            _timer?.cancel();

                            _timer = Timer(Duration(seconds: 1), () {
                              // Call your function here
                              filtredHosts();
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
                      const Divider(
                          color: Colors.grey,
                          height: 1,
                          indent: 0,
                          thickness: 0.5),
                      FilterTab(
                          title: 'Host Service',
                          filtringListFunction: (item, value) {
                            setState(() {
                              item.checked = value ?? false;
                              isExist(item.id!, value!);
                              filterInputs['terms'] = terms;
                              listHosts = [];
                              listLengthFromLastCall = 0;
                            });
                            _timer?.cancel();

                            _timer = Timer(Duration(seconds: 1), () {
                              // Call your function here
                              filtredHosts();
                            });
                            print(terms.length);
                          },
                          showMoreFunction: () {
                            setState(() {
                              _showAllHotel = !_showAllHotel;
                            });
                          },
                          displayedList: displayedListHotelService,
                          showAllAct: _showAllHotel),
                      Container(
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              listHosts = [];
                              terms = [];

                              filterInputs = {
                                'min': '',
                                'max': '',
                                'terms': []
                              };
                            });

                            callHosts();
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
