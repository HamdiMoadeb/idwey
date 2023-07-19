import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:idwey/models/host.dart';
import 'package:idwey/models/room.dart';
import 'package:idwey/screens/add_r%C3%A9servation_page/add_reservation_page.dart';
import 'package:idwey/services/activityCalls.dart';
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

class VerifyDisponibility extends StatefulWidget {
  // final HostDetail? hostDetail;
  final TypeReservation typeReservation;
  final String? activityDuration;
  final String? currency;
  final String id;
  final String title;
  final String address;
  final String? typeHost;
  final int? currencyValue;
  final String? currencyName;
  final String? startDate;
  final String? sale_price;
  final String? per_person;
  final int? min_nuits;
  final String? price;
  const VerifyDisponibility(
      {Key? key,
      this.sale_price,
      this.per_person,
      this.price,
      //  this.hostDetail,
      this.currency,
      this.typeHost,
      this.currencyValue,
      this.currencyName,
      required this.id,
      required this.title,
      required this.address,
      required this.typeReservation,
      this.startDate,
      this.activityDuration,
      this.min_nuits})
      : super(key: key);

  @override
  State<VerifyDisponibility> createState() => _VerifyDisponibilityState();
}

class _VerifyDisponibilityState extends State<VerifyDisponibility> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  final List<Room> rooms = [];

  SharedPreferences? prefs;
  bool disponible = false;
  String totalPrice = '';
  String nb_nuites = "1";
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
  DateTimeRange? picked;
  Map<String, String> searchInputs = {
    'start': '',
    'end': '',
    'address': '',
    'adults': ''
  };
  String start = DateFormat('yyyy-MM-dd').format(DateTime.now());
  String end = DateFormat('yyyy-MM-dd').format(
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 1),
  );
  String dateRange =
      '${DateFormat('yyyy-MM-dd').format(DateTime.now())} - ${DateFormat('yyyy-MM-dd').format(
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 1),
  )}';

  dateTimeRangePicker() async {
    picked = await showDateRangePicker(
        context: context,
        firstDate: DateTime.now(),
        saveText: 'Valider',
        confirmText: 'Valider',
        locale: const Locale("fr", "FR"),
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
            '${DateFormat('yyyy-MM-dd').format(picked!.start)} - ${DateFormat('yyyy-MM-dd').format(picked!.end)}';
        start = '${DateFormat('yyyy-MM-dd').format(picked!.start)}';
        end = '${DateFormat('yyyy-MM-dd').format(picked!.end)}';
        nb_nuites = picked!.end.difference(picked!.start).inDays.toString();
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
                              widget.per_person != '' &&
                                      widget.typeReservation ==
                                          TypeReservation.host
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
                        Visibility(
                            visible: widget.typeReservation ==
                                    TypeReservation.activity ||
                                widget.typeReservation ==
                                    TypeReservation.experience,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Date départ :',
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
                                    margin:
                                        EdgeInsets.symmetric(vertical: 10.h),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      border:
                                          Border.all(color: Colors.grey[200]!),
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
                              ],
                            )),
                        widget.typeReservation == TypeReservation.host
                            ? Column(
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
                                      margin:
                                          EdgeInsets.symmetric(vertical: 10.h),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                        border: Border.all(
                                            color: Colors.grey[200]!),
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
                                      margin:
                                          EdgeInsets.symmetric(vertical: 10.h),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                        border: Border.all(
                                            color: Colors.grey[200]!),
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
                                  const Divider(thickness: 1),
                                  const SizedBox(height: 3),
                                ],
                              )
                            : const SizedBox.shrink(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.typeReservation == TypeReservation.product
                                  ? 'Nombres'
                                  : 'Personnes',
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
                  SizedBox(height: 20.h),
                  Visibility(
                    visible: widget.typeReservation == TypeReservation.event ||
                        widget.typeReservation == TypeReservation.product,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20.h),
                      padding: EdgeInsets.symmetric(
                          vertical: 16.h, horizontal: 16.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.r),
                        border: Border.all(color: Colors.grey[300]!, width: 1),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                        '${removeDecimalZeroFormat(currencies[selectedCurrency]['symbol'] != 'DT' ? currencyConverteur(2, getTotalPrice(widget.price!, adultsCount.toString())!) : currencyConverteur(currencies[selectedCurrency]['value']!, getTotalPrice(widget.price!, adultsCount.toString())!))} ${currencies[selectedCurrency]['symbol']}',
                                    style: TextStyle(
                                      color: primaryOrange,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w500,
                                      decoration: TextDecoration.none,
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  widget.typeReservation == TypeReservation.host ||
                          widget.typeReservation == TypeReservation.activity ||
                          widget.typeReservation == TypeReservation.experience
                      ? SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                primary: primaryOrange,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.r),
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
                                } else if (int.tryParse(nb_nuites.toString())! <
                                    widget.min_nuits!) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'nombre de nuitées doit être supérieur à ${widget.min_nuits}',
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
                                      widget.id.toString() ?? "");
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
                        )
                      : SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                primary: primaryOrange,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.r),
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AddReservationPage(
                                      typeReservation: widget.typeReservation,
                                      hostName: widget.title,
                                      dateDebut: widget.typeReservation ==
                                              TypeReservation.event
                                          ? DateFormat('yyyy-MM-dd').format(
                                              DateTime.parse(
                                                  widget.startDate ?? ""))
                                          : "",
                                      dateFin: widget.typeReservation ==
                                              TypeReservation.event
                                          ? DateFormat('yyyy-MM-dd').format(
                                              DateTime.parse(
                                                  widget.startDate ?? ""))
                                          : "",
                                      adultes: adultsCount.toString(),
                                      total: getTotalPrice(widget.price!,
                                          adultsCount.toString()),
                                      // nuits: nb_nuites.toString(),
                                      id: widget.id.toString(),
                                      address: widget.address,
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
                                child: Text(
                                  'Réserver maintenant',
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
                                            style: TextStyle(
                                              color: primaryOrange,
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.w500,
                                              decoration: TextDecoration.none,
                                            )),
                                        widget.typeReservation ==
                                                TypeReservation.host
                                            ? adultsCount != 1
                                                ? TextSpan(
                                                    text:
                                                        ' /${nb_nuites} nuitées',
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
                                                            FontWeight.w500))
                                            : TextSpan(
                                                text: '',
                                              ),
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
                                    primary: primaryOrange,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.r),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            AddReservationPage(
                                          typeReservation:
                                              widget.typeReservation,
                                          hostName: widget.title ?? "",
                                          dateDebut: start,
                                          activityDuration:
                                              widget.activityDuration,
                                          dateFin: end,
                                          adultes: adultsCount.toString(),
                                          total: totalPrice.toString(),
                                          nuits: nb_nuites.toString(),
                                          id: widget.id.toString(),
                                          address: widget.address,
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
                                    child: Text(
                                      'Demande de réservation',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16.sp,
                                      ),
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
                                    physics: const ScrollPhysics(),
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
                                    primary: primaryOrange,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.r),
                                    ),
                                  ),
                                  onPressed: selectedRooms.isEmpty
                                      ? null
                                      : () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  AddReservationPage(
                                                typeReservation:
                                                    TypeReservation.host,
                                                hostName: widget.title,
                                                dateDebut: start,
                                                dateFin: end,
                                                adultes: adultsCount.toString(),
                                                total:
                                                    roomsPriceTotal.toString(),
                                                nuits: nb_nuites.toString(),
                                                id: widget.id.toString(),
                                                address: widget.address,
                                                rooms: selectedList,
                                                selectedRooms: selectedRooms,
                                                currencyValue:
                                                    widget.currencyValue,
                                                currencyName:
                                                    widget.currencyName,
                                                currency: widget.currency,
                                              ),
                                            ),
                                          );
                                        },
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 8.h, horizontal: 16.w),
                                    child: Text(
                                      'Demande de réservation',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16.sp,
                                      ),
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
    if (widget.typeReservation == TypeReservation.experience) {
      ExperienceCalls.getExperienceDisponibility(
              dateStart, adultes, children, id)
          .then((result) async {
        setState(() {
          if (result["disponible"] == true) {
            disponible = true;
            totalPrice = result["price"].toString();
          } else {
            disponible = false;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  result["messages"] == []
                      ? 'une erreur est produite , veuillez réessayer ultérieurement'
                      : 'Le nombre minimum des invités est 7',
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
        });

        setState(() {
          loading = false;
        });
      });
    }
    if (widget.typeReservation == TypeReservation.activity) {
      ActivityCalls.getActivityDisponibility(dateStart, adultes, children, id)
          .then((result) async {
        setState(() {
          if (result["disponible"] == true) {
            disponible = true;
            totalPrice = result["price"].toString();
          } else {
            disponible = false;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  result["messages"] == []
                      ? 'une erreur est produite , veuillez réessayer ultérieurement'
                      : 'Le nombre minimum des invités est 7',
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
        });

        setState(() {
          loading = false;
        });
      });
    } else if (widget.typeReservation == TypeReservation.host) {
      HostCalls.getHostDisponibility(dateStart, dateEnd, adultes, children, id)
          .then((result) async {
        setState(() {
          if (widget.typeHost == "Par Chalet") {
            rooms.clear();

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
                        ? 'une erreur est produite , veuillez réessayer ultérieurement'
                        : "Essayez de sélectionner une autre date. Cette date n'est pas disponible",
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
}
