import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:idwey/utils/colors.dart';
import 'package:idwey/widgets/common/scaffold.dart';

import '../../models/event.dart';
import '../../models/sharedModel.dart';
import '../../services/eventCalls.dart';
import '../../utils/utils.dart';
import '../../widgets/common/filterWidget.dart';
import '../../widgets/common/footer.dart';
import '../../widgets/listItems/eventListItem.dart';
import '../../widgets/tabs/EventFilterTab.dart';

class EventPage extends StatefulWidget {
  dynamic searchInputs;
  EventPage({
    Key? key,
    required this.searchInputs,
  }) : super(key: key);

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  List<Event> listEvents = [];
  List<Terms> listConvience = [];
  List<Terms> listType = [];
  List<int> terms = [];
  bool loading = false;
  bool showFAB = false;
  int listLengthFromLastCall = 0;
  int total = 0;
  double max = 0;
  double min = 0;
  double _lowerValue = 0;
  double _upperValue = 0;

  bool _showAllConv = false;
  bool _showAllType = false;
  var posKey = GlobalKey();

  dynamic filterInputs = {'min': '', 'max': '', 'terms': []};

  dynamic searchInputs = {
    'start': '',
    'end': '',
    'address': '',
    'location_id': ''
  };

  void scrollToTop() {
    scrollController.animateTo(0,
        duration: const Duration(seconds: 2), curve: Curves.linear);
  }

  void updateSearchFields(dynamic searchInputs) {
    setState(() {
      listEvents.clear();
      this.searchInputs = searchInputs;
    });
    callEvents();
  }

  isExist(int x, bool checked) {
    if (checked) {
      if (!terms.contains(x)) terms.add(x);
    } else {
      if (terms.contains(x)) terms.remove(x);
    }
  }

  filtredEvents() {
    setState(() {
      loading = true;
    });
    EventCalls.getEventsList(searchInputs, listEvents.length, filterInputs)
        .then((result) async {
      setState(() {
        listLengthFromLastCall = result["list"].length;
        listEvents = result["list"];
        total = result["total"];
      });
      await Future.delayed(Duration(seconds: 1));
      setState(() {
        loading = false;
      });
    });
  }

  callEvents() {
    setState(() {
      loading = true;
    });
    EventCalls.getEventsList(searchInputs, listEvents.length,
        {'min': '', 'max': '', 'terms': []}).then((result) async {
      setState(() {
        listLengthFromLastCall = result["list"].length;
        listEvents.addAll(result["list"]);
        total = result["total"];
        max = double.parse(result["priceRange"][1]);
        min = double.parse(result["priceRange"][0]);
        filterInputs['min'] = min.toInt().toString();
        filterInputs['max'] = max.toInt().toString();
        _lowerValue = min;
        _upperValue = max;
        searchInputs = result["searchInputs"];
        listConvience = result["listConvenience"];
        listType = result["listType"];
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

    checkInternetConnectivity(context, callEvents);
    if (widget.searchInputs != '') searchInputs = widget.searchInputs;
    scrollController.addListener(() {
      if ((scrollController.position.pixels + 2000) >=
              scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange &&
          !loading &&
          !(listLengthFromLastCall < 20)) {
        callEvents();
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
    List<Terms> displayedListConvience = [];
    List<Terms> displayedListType = [];

    if (listConvience.isNotEmpty && listType.isNotEmpty) {
      displayedListConvience =
          _showAllConv ? listConvience : listConvience.sublist(0, 3);
      displayedListType = _showAllType ? listType : listType.sublist(0, 3);
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
                            child: Image.asset("assets/eventcover.jpg",
                                fit: BoxFit.cover),
                          ),
                        ),
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Calendrier \n d\'événements',
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
                      child: EventFilterTab(
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
                                listEvents = [];
                                listLengthFromLastCall = 0;
                              });
                              filtredEvents();
                            }),
                        const Divider(
                            color: Colors.grey,
                            height: 1,
                            indent: 0,
                            thickness: 0.5),
                        FilterTab(
                            title: 'Type de l\'événement',
                            filtringListFunction: (item, value) {
                              setState(() {
                                item.checked = value ?? false;
                                isExist(item.id!, value!);
                                filterInputs['terms'] = terms;
                                listEvents = [];
                                listLengthFromLastCall = 0;
                              });
                              filtredEvents();
                              print(terms.length);
                            },
                            showMoreFunction: () {
                              setState(() {
                                _showAllType = !_showAllType;
                              });
                            },
                            displayedList: displayedListType,
                            showAllAct: _showAllType),
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
                                listEvents = [];
                                listLengthFromLastCall = 0;
                              });
                              filtredEvents();
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
                                listEvents = [];
                                filterInputs = {
                                  'min': '',
                                  'max': '',
                                  'terms': []
                                };

                                searchInputs = {
                                  'start': '',
                                  'end': '',
                                  'address': '',
                                  'location_id': ''
                                };
                              });

                              callEvents();
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
                        "${total} Événements trouvés",
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
                        child: EventListItem(listEvents[index])),
                    itemCount: listEvents.length,
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
