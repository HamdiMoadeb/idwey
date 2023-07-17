import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:idwey/models/host.dart';
import 'package:idwey/models/reservation.dart';
import 'package:idwey/models/room.dart';
import 'package:idwey/screens/add_r%C3%A9servation_page/add_reservation_page.dart';
import 'package:idwey/services/activityCalls.dart';
import 'package:idwey/services/authCalls.dart';
import 'package:idwey/services/experienceCalls.dart';
import 'package:idwey/services/hostCalls.dart';
import 'package:idwey/services/productCalls.dart';
import 'package:idwey/utils/colors.dart';
import 'package:idwey/utils/enums.dart';
import 'package:idwey/utils/utils.dart';
import 'package:idwey/widgets/common/scaffold.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:string_translate/string_translate.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({
    Key? key,
  }) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  SharedPreferences? prefs;
  List<Reservation> listReservation = [];
  Map currencies = {
    'TND': {'value': 1, 'symbol': 'DT'},
    'EUR': {'value': 2, 'symbol': '€'},
    'USD': {'value': 2, 'symbol': '\$'},
  };
  String selectedCurrency = '';
  bool loading = false;
  bool showFAB = false;

  Future<void> _loadSelectedCurrency() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedCurrency = prefs?.getString('selectedCurrency') ?? 'TND';
    });
  }

  @override
  void initState() {
    _loadSelectedCurrency();

    checkInternetConnectivity(context, getHistory);
    super.initState();
  }

  void scrollToTop() {
    scrollController.animateTo(0,
        duration: const Duration(seconds: 2), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      changeCurrency: _loadSelectedCurrency(),
      showFab: showFAB,
      backtotop: scrollToTop,
      scaffoldKey: _scaffoldKey,
      body: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      'Liste des commandes',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  ListView.separated(
                    itemBuilder: (context, index) {
                      return Card(
                          shape: RoundedRectangleBorder(
                            side:
                                BorderSide(color: Colors.grey[400]!, width: 1),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          elevation: 0,
                          margin: EdgeInsets.zero,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16.w, vertical: 16.w),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            listReservation[index].title ?? "",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6,
                                          ),
                                          Text(
                                            listReservation[index].status ?? "",
                                            style:
                                                TextStyle(color: primaryOrange),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 16.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Type d'hébergement",
                                              style: TextStyle(
                                                color: primary,
                                              )),
                                          Text(
                                            listReservation[index]
                                                    .objectModel ??
                                                "",
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Date de réservation : ",
                                              style: TextStyle(
                                                color: primary,
                                              )),
                                          Text(
                                            DateFormat('yyyy-MM-dd').format(
                                                listReservation[index]
                                                    .createdAt!),
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Date debut",
                                            style: TextStyle(
                                              color: primary,
                                            ),
                                          ),
                                          Text(
                                            DateFormat('yyyy-MM-dd').format(
                                                listReservation[index]
                                                    .startDate!),
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Date  fin",
                                            style: TextStyle(
                                              color: primary,
                                            ),
                                          ),
                                          Text(
                                            DateFormat('yyyy-MM-dd').format(
                                                listReservation[index]
                                                    .endDate!),
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8.h,
                                      ),
                                      Divider(),
                                      SizedBox(
                                        height: 8.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Total",
                                              style: TextStyle(
                                                  color: primaryOrange,
                                                  fontSize: 18.sp,
                                                  fontWeight: FontWeight.bold)),
                                          Text(
                                            '${removeDecimalZeroFormat(currencies[selectedCurrency]['symbol'] != 'DT' ? currencyConverteur(currencies[selectedCurrency]['value']!, listReservation[index].total!) : listReservation[index].total!)} ${currencies[selectedCurrency]['symbol']}',
                                            style: TextStyle(
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8.h,
                                      ),
                                    ],
                                  ),
                                )
                              ]));
                    },
                    itemCount: listReservation.length,
                    shrinkWrap: true,
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 16.h,
                      );
                    },
                  ),
                ],
              ),
            ),
    );
  }

  getHistory() async {
    setState(() {
      loading = true;
    });

    prefs = await SharedPreferences.getInstance();
    String? token = prefs!.getString('token');
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token!);
    String customer_id = decodedToken['id'].toString();

    AuthCalls.getAllReservations(customer_id).then((value) {
      setState(() {
        loading = false;
      });
      if (value != null) {
        for (Map i in value) {
          listReservation.add(Reservation.fromJson(jsonDecode(jsonEncode(i))));
          // if (i["object_model"] == "hotel") {
          //   callHosts(i["object_id"]);
          // }
        }
      }
    });
    await Future.delayed(Duration(seconds: 1));

    setState(() {
      loading = false;
    });
  }

  // HostDetail hostDetail = HostDetail(0, '', '', '', '', [], 0, '', '', 0, '',
  //     '', '', [], '', '', 0, 0, [], '', []);
  // callHosts(int id) async {
  //   setState(() {
  //     loading = true;
  //   });
  //   await _loadSelectedCurrency();
  //
  //   HostCalls.getHostDetails(id).then((result) async {
  //     setState(() {
  //       hostDetail = result['hostDetail'];
  //       currencies['EUR']['value'] = result["eur"];
  //       currencies['USD']['value'] = result["usd"];
  //     });
  //   });
  // }
}
