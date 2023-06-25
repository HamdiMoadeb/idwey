import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:idwey/models/host.dart';
import 'package:idwey/models/room.dart';
import 'package:idwey/screens/add_r%C3%A9servation_page/add_reservation_page.dart';
import 'package:idwey/services/hostCalls.dart';
import 'package:idwey/utils/colors.dart';
import 'package:idwey/utils/utils.dart';
import 'package:idwey/widgets/common/detailsWidgets.dart';
import 'package:idwey/widgets/common/scaffold.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VerifyDisponibility extends StatefulWidget {
  final HostDetail hostDetail;
  final String? currency;
  final String? typeHost;
  final int? currencyValue;
  final String? currencyName;
  final String? sale_price;
  final String? per_person;
  final String? price;
  const VerifyDisponibility(
      {Key? key,
      this.sale_price,
      this.per_person,
      this.price,
      required this.hostDetail,
      this.currency,
      this.typeHost,
      this.currencyValue,
      this.currencyName})
      : super(key: key);

  @override
  State<VerifyDisponibility> createState() => _VerifyDisponibilityState();
}

class _VerifyDisponibilityState extends State<VerifyDisponibility> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  List<Room> rooms = [];

  SharedPreferences? prefs;
  bool disponible = false;
  String totalPrice = '';
  String nb_nuites = "";
  Map currencies = {
    'TND': {'value': 1, 'symbol': 'DT'},
    'EUR': {'value': 2, 'symbol': '€'},
    'USD': {'value': 2, 'symbol': '\$'},
  };
  String selectedCurrency = '';
  bool loading = false;
  bool showFAB = false;
  bool isChecked = false;
  bool isChecked1 = false;
  List<int> selectedList = [];
  List<Room> selectedRooms = [];
  double roomsPriceTotal = 0.0;

  Future<void> _loadSelectedCurrency() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedCurrency = prefs?.getString('selectedCurrency') ?? 'TND';
    });
  }

  @override
  void initState() {
    _loadSelectedCurrency();
    //checkInternetConnectivity(context,);
    super.initState();
  }

  void scrollToTop() {
    scrollController.animateTo(0,
        duration: const Duration(seconds: 2), curve: Curves.linear);
  }

  int adultsCount = 0;

  Map<String, String> searchInputs = {
    'start': '',
    'end': '',
    'address': '',
    'adults': ''
  };
  String start = DateFormat('dd-MM-yyyy').format(DateTime.now());
  String end = DateFormat('dd-MM-yyyy').format(
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 1),
  );
  String dateRange =
      '${DateFormat('dd-MM-yyyy').format(DateTime.now())} - ${DateFormat('dd-MM-yyyy').format(
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 1),
  )}';

  dateTimeRangePicker() async {
    DateTimeRange? picked = await showDateRangePicker(
        context: context,
        firstDate: DateTime.now(),
        saveText: 'Valider',
        confirmText: 'Valider',
        initialEntryMode: DatePickerEntryMode.calendar,
        lastDate: DateTime(DateTime.now().year + 5),
        builder: (context, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 350,
                  maxHeight: 500,
                ),
                child: Theme(
                  data: Theme.of(context).copyWith(
                    colorScheme: ColorScheme.light(
                        onPrimary: Colors.white, primary: primary),
                  ),
                  child: child!,
                ),
              )
            ],
          );
        });
    if (picked != null) {
      setState(() {
        dateRange =
            '${DateFormat('dd-MM-yyyy').format(picked.start)} - ${DateFormat('dd-MM-yyyy').format(picked.end)}';
        start = '${DateFormat('dd-MM-yyyy').format(picked.start)}';
        end = '${DateFormat('dd-MM-yyyy').format(picked.end)}';
        nb_nuites = picked.end.difference(picked.start).inDays.toString();
        searchInputs['start'] = start;
        searchInputs['end'] = end;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      changeCurrency: _loadSelectedCurrency(),
      showFab: showFAB,
      backtotop: scrollToTop,
      scaffoldKey: _scaffoldKey,
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: scrollController,
            child: Padding(
              padding: EdgeInsets.only(left: 16.h, right: 16.h, top: 60.h),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.r),
                      border: Border.all(color: Colors.grey[300]!, width: 1),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.h, vertical: 16.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: '',
                            children: <TextSpan>[
                              TextSpan(
                                  text:
                                      '${removeDecimalZeroFormat(currencies[selectedCurrency]['symbol'] != 'DT' ? currencyConverteur(currencies[selectedCurrency]['value']!, widget.price!) : currencyConverteur(currencies[selectedCurrency]['value']!, widget.price!))} ${currencies[selectedCurrency]['symbol']}',

                                  // text: '${widget.price}',
                                  style: TextStyle(
                                    color: titleBlack,
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.none,
                                  )),
                              widget.per_person != ''
                                  ? TextSpan(
                                      text: ' /${widget.per_person}',
                                      style: TextStyle(
                                          color: grey,
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w500))
                                  : TextSpan(),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 1,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Arrivée :',
                              style: TextStyle(
                                color: materialPrimary,
                                fontWeight: FontWeight.w500,
                                fontSize: 18.sp,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                dateTimeRangePicker();
                              },
                              child: Container(
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16.w, vertical: 8.h),
                                margin: EdgeInsets.symmetric(vertical: 10.h),
                                decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  border: Border.all(color: Colors.grey[200]!),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text(
                                  start,
                                  style: TextStyle(
                                    color: grey,
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              'Départ',
                              style: TextStyle(
                                color: materialPrimary,
                                fontWeight: FontWeight.w500,
                                fontSize: 18.sp,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                dateTimeRangePicker();
                              },
                              child: Container(
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16.w, vertical: 8.h),
                                margin: EdgeInsets.symmetric(vertical: 10.h),
                                decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  border: Border.all(color: Colors.grey[200]!),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text(
                                  end,
                                  style: TextStyle(
                                    color: grey,
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Divider(thickness: 1),
                        const SizedBox(height: 3),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Personnes',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 18.sp,
                              ),
                            ),
                            SizedBox(
                              width: 60.w,
                            ),
                            IconButton(
                              onPressed: () {
                                if (adultsCount > 1) {
                                  setState(() {
                                    adultsCount--;
                                  });
                                }
                              },
                              icon: const Icon(
                                Icons.remove_circle_outline,
                                size: 24,
                              ),
                            ),
                            Text(
                              '$adultsCount',
                              style: TextStyle(
                                color: primaryOrange,
                                fontWeight: FontWeight.w500,
                                fontSize: 18.sp,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  adultsCount++;
                                });
                              },
                              icon: const Icon(
                                Icons.add_circle_outline,
                                size: 24,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(
                  //   height: 16.h,
                  // ),
                  // Visibility(
                  //   visible: widget.typeHost == "Par Chalet",
                  //   child: Container(
                  //     padding:
                  //         EdgeInsets.only(top: 8.h, bottom: 8.h, right: 16.h),
                  //     decoration: BoxDecoration(
                  //       color: Colors.white,
                  //       borderRadius: BorderRadius.circular(5.r),
                  //       border: Border.all(color: Colors.grey[300]!, width: 1),
                  //     ),
                  //     child: Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         Padding(
                  //           padding: EdgeInsets.only(left: 8.h),
                  //           child: Text(
                  //             "Prix Extra",
                  //             style: TextStyle(
                  //                 fontSize: 18.sp,
                  //                 color: materialPrimary,
                  //                 fontWeight: FontWeight.w500),
                  //           ),
                  //         ),
                  //         Row(
                  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //           children: [
                  //             Row(
                  //               mainAxisAlignment: MainAxisAlignment.start,
                  //               children: [
                  //                 Checkbox(
                  //                   checkColor: Colors.white,
                  //                   value: isChecked,
                  //                   onChanged: (bool? value) {
                  //                     setState(() {
                  //                       isChecked = value!;
                  //                     });
                  //                   },
                  //                 ),
                  //                 SizedBox(
                  //                   width: 170.w,
                  //                   child: Text('Studio pour 2 personnes',
                  //                       maxLines: 1,
                  //                       style: TextStyle(
                  //                         color: Colors.black,
                  //                         fontSize: 14.sp,
                  //                         overflow: TextOverflow.ellipsis,
                  //                         fontWeight: FontWeight.w500,
                  //                       )),
                  //                 ),
                  //               ],
                  //             ),
                  //             Text(
                  //               '100 DT',
                  //               style: TextStyle(
                  //                 color: materialPrimary,
                  //                 fontSize: 16.sp,
                  //                 fontWeight: FontWeight.w500,
                  //               ),
                  //             )
                  //           ],
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  SizedBox(height: 20.h),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.r),
                          ),
                        ),
                        onPressed: () {
                          if (adultsCount == 0) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'nombre de personnes doit être supérieur à 0',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.sp,
                                  ),
                                ),
                                backgroundColor: Colors.red,
                              ),
                            );
                            return;
                          } else {
                            verifyDisponibility(
                                start,
                                end,
                                "0",
                                adultsCount.toString(),
                                widget.hostDetail.id.toString());
                          }
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 8.h, horizontal: 16.w),
                          child: Text(
                            'Vérifier la disponibilité',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp,
                            ),
                          ),
                        )),
                  ),
                  disponible
                      ? Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 20.h),
                              padding: EdgeInsets.symmetric(
                                  vertical: 16.h, horizontal: 16.w),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5.r),
                                border: Border.all(
                                    color: Colors.grey[300]!, width: 1),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Prix Total',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18.sp,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 60.w,
                                  ),
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      text: '',
                                      children: <TextSpan>[
                                        TextSpan(
                                            text:
                                                '${removeDecimalZeroFormat(currencies[selectedCurrency]['symbol'] != 'DT' ? currencyConverteur(currencies[selectedCurrency]['value']!, totalPrice) : currencyConverteur(currencies[selectedCurrency]['value']!, totalPrice))} ${currencies[selectedCurrency]['symbol']}',

                                            //  '${removeDecimalZeroFormat(currencies[widget.currencyName][widget.currency] != 'DT' ? currencyConverteur(widget.currencyValue!, totalPrice) : getTotalPrice(totalPrice, nb_nuites) ?? "")} ${currencies[selectedCurrency]['symbol']}',

                                            // text: '${totalPrice}',
                                            style: TextStyle(
                                              color: primaryOrange,
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.w500,
                                              decoration: TextDecoration.none,
                                            )),
                                        adultsCount != 1
                                            ? TextSpan(
                                                text: ' /${nb_nuites} nuitées',
                                                style: TextStyle(
                                                    color: grey,
                                                    fontSize: 16.sp,
                                                    fontWeight:
                                                        FontWeight.w500))
                                            : TextSpan(
                                                text: ' /${nb_nuites} nuit',
                                                style: TextStyle(
                                                    color: grey,
                                                    fontSize: 16.sp,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20.h),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25.r),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            AddReservationPage(
                                          dateDebut: start,
                                          dateFin: end,
                                          adultes: adultsCount.toString(),
                                          total: totalPrice.toString(),
                                          nuits: nb_nuites.toString(),
                                          id: widget.hostDetail.id.toString(),
                                          address: widget.hostDetail.address,
                                          currencyValue: widget.currencyValue,
                                          currencyName: widget.currencyName,
                                          currency: widget.currency,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 8.h, horizontal: 16.w),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Demande de réservation',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16.sp,
                                          ),
                                        ),
                                        SizedBox(width: 10.w),
                                        const FaIcon(
                                          FontAwesomeIcons.tree,
                                          color: Colors.green,
                                          size: 16,
                                        )
                                      ],
                                    ),
                                  )),
                            ),
                          ],
                        )
                      : Container(),
                  rooms.isEmpty
                      ? Container()
                      : Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 20.h),
                              padding: EdgeInsets.symmetric(
                                  vertical: 16.h, horizontal: 16.w),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5.r),
                                border: Border.all(
                                    color: Colors.grey[300]!, width: 1),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Chambres',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18.sp,
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  ListView.separated(
                                    shrinkWrap: true,
                                    itemCount: rooms.length,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 10.h),
                                            child: Row(
                                              children: [
                                                Checkbox(
                                                  value: selectedList.contains(
                                                      rooms[index].id),
                                                  onChanged: (bool? value) {
                                                    setState(() {
                                                      if (value!) {
                                                        selectedList.add(
                                                            rooms[index].id!);
                                                        selectedRooms
                                                            .add(rooms[index]);
                                                        roomsPriceTotal +=
                                                            double.tryParse(
                                                                getTotalPrice(
                                                                    rooms[index]
                                                                        .price!,
                                                                    nb_nuites)!)!;
                                                      } else {
                                                        selectedList.remove(
                                                            rooms[index].id);
                                                        selectedRooms.remove(
                                                            rooms[index]);

                                                        roomsPriceTotal -=
                                                            double.tryParse(
                                                                getTotalPrice(
                                                                    rooms[index]
                                                                        .price!,
                                                                    nb_nuites)!)!;
                                                      }
                                                    });
                                                  },
                                                ),
                                                SizedBox(
                                                  width: 200.w,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                          '${rooms[index].title}',
                                                          maxLines: 2,
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 16.sp,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          )),
                                                      Text(
                                                        '${removeDecimalZeroFormat(currencies[selectedCurrency]['symbol'] != 'DT' ? currencyConverteur(currencies[selectedCurrency]['value']!, getTotalPrice(rooms[index].price!, nb_nuites)!) : currencyConverteur(currencies[selectedCurrency]['value']!, getTotalPrice(rooms[index].price!, nb_nuites)!))} ${currencies[selectedCurrency]['symbol']}',

                                                        // '${removeDecimalZeroFormat(currencies[widget.currencyName][widget.currency] != 'DT' ? currencyConverteur(widget.currencyValue!, getTotalPrice(rooms[index].price!, nb_nuites)!) : getTotalPrice(rooms[index].price!, nb_nuites) ?? "")} ${currencies[selectedCurrency]['symbol']}/ ${nb_nuites} nuitées',

                                                        // '${getTotalPrice(rooms[index].price!, nb_nuites)} DT / ${nb_nuites} nuitées',
                                                        style: TextStyle(
                                                          color: primaryOrange,
                                                          fontSize: 14.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return Divider(height: 1.h);
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20.h),
                              padding: EdgeInsets.symmetric(
                                  vertical: 16.h, horizontal: 16.w),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5.r),
                                border: Border.all(
                                    color: Colors.grey[300]!, width: 1),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Prix Total',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18.sp,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 60.w,
                                  ),
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      text: '',
                                      children: <TextSpan>[
                                        TextSpan(
                                            text:
                                                // '${removeDecimalZeroFormat(currencies[widget.currencyName][widget.currency] != 'DT' ? currencyConverteur(widget.currencyValue!, roomsPriceTotal.toInt().toString()) : getTotalPrice(roomsPriceTotal.toInt().toString(), nb_nuites) ?? "")} ${currencies[selectedCurrency]['symbol']}',
                                                '${removeDecimalZeroFormat(currencies[selectedCurrency]['symbol'] != 'DT' ? currencyConverteur(currencies[selectedCurrency]['value']!, roomsPriceTotal.toInt().toString()) : currencyConverteur(currencies[selectedCurrency]['value']!, roomsPriceTotal.toInt().toString()))} ${currencies[selectedCurrency]['symbol']}',
                                            style: TextStyle(
                                              color: primaryOrange,
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.w500,
                                              decoration: TextDecoration.none,
                                            )),
                                        adultsCount != 1
                                            ? TextSpan(
                                                text: ' /${nb_nuites} nuitées',
                                                style: TextStyle(
                                                    color: grey,
                                                    fontSize: 16.sp,
                                                    fontWeight:
                                                        FontWeight.w500))
                                            : TextSpan(
                                                text: ' /${nb_nuites} nuit',
                                                style: TextStyle(
                                                    color: grey,
                                                    fontSize: 16.sp,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            /// reservation button
                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 16.h,
                              ),
                              width: double.infinity,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25.r),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            AddReservationPage(
                                          dateDebut: start,
                                          dateFin: end,
                                          adultes: adultsCount.toString(),
                                          total: roomsPriceTotal.toString(),
                                          nuits: nb_nuites.toString(),
                                          id: widget.hostDetail.id.toString(),
                                          address: widget.hostDetail.address,
                                          rooms: selectedList,
                                          selectedRooms: selectedRooms,
                                          currencyValue: widget.currencyValue,
                                          currencyName: widget.currencyName,
                                          currency: widget.currency,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 8.h, horizontal: 16.w),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Demande de réservation',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16.sp,
                                          ),
                                        ),
                                        SizedBox(width: 10.w),
                                        const FaIcon(
                                          FontAwesomeIcons.tree,
                                          color: Colors.green,
                                          size: 16,
                                        )
                                      ],
                                    ),
                                  )),
                            ),
                          ],
                        ),
                ],
              ),
            ),
          ),
          loading
              ? const Center(child: CircularProgressIndicator())
              : Container(),
        ],
      ),
    );
  }

  void verifyDisponibility(String dateStart, String dateEnd, String children,
      String adultes, String id) async {
    setState(() {
      loading = true;
    });
    await _loadSelectedCurrency();

    HostCalls.getHostDisponibility(dateStart, dateEnd, adultes, children, id)
        .then((result) async {
      setState(() {
        if (widget.typeHost == "Par Chalet") {
          for (int i = 0; i < result.length; i++) {
            rooms.add(Room.fromJson(result[i]));
          }
        } else {
          if (result["disponible"] == true) {
            disponible = true;
            totalPrice = result["price"].toString();
          } else {
            disponible = false;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  result["messages"] == []
                      ? 'Cette maison n\'est pas disponible pour cette période'
                      : result["messages"][0][0].toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                  ),
                ),
                backgroundColor: Colors.red,
              ),
            );
          }
        }
      });
      await Future.delayed(const Duration(milliseconds: 30));
      setState(() {
        loading = false;
      });
    });
  }
}
