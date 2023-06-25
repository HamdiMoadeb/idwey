import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:idwey/models/room.dart';
import 'package:idwey/screens/add_r%C3%A9servation_page/sections/payement_section.dart';
import 'package:idwey/screens/add_r%C3%A9servation_page/sections/reservation_form.dart';
import 'package:idwey/screens/verify_disponibility_page/verify_disponibility_page.dart';
import 'package:idwey/utils/constants.dart';
import 'package:idwey/utils/enums.dart';
import 'package:idwey/widgets/listItems/ChaletListItem.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/host.dart';
import '../../services/hostCalls.dart';
import '../../utils/colors.dart';
import '../../utils/utils.dart';
import '../../widgets/common/CalanderCommon.dart';
import '../../widgets/common/ImageCommon.dart';
import '../../widgets/common/MapCommon.dart';
import '../../widgets/common/detailsWidgets.dart';
import '../../widgets/common/footer.dart';
import '../../widgets/common/scaffold.dart';
import 'sections/reservation_section.dart';

class AddReservationPage extends StatefulWidget {
  final String id;
  final String? address;
  final String? region;
  final String? dateDebut;
  final String? dateFin;
  final String? nuits;
  final String? adultes;
  final String? total;
  final List? rooms;
  final List<Room>? selectedRooms;
  final int? currencyValue;
  final String? currencyName;
  final String? currency;

  const AddReservationPage(
      {Key? key,
      this.address,
      this.region,
      this.dateDebut,
      this.dateFin,
      this.nuits,
      this.adultes,
      this.total,
      this.rooms,
      required this.id,
      required this.currencyValue,
      required this.currencyName,
      required this.currency,
      this.selectedRooms})
      : super(key: key);

  @override
  State<AddReservationPage> createState() => _AddReservationPageState();
}

class _AddReservationPageState extends State<AddReservationPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  TextEditingController controller = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController villeController = TextEditingController();
  TextEditingController paysController = TextEditingController();

  SharedPreferences? prefs;
  bool isChecked = false;
  bool offline = false;
  bool loading = false;
  bool showFAB = false;

  String selectedCurrency = '';

  String currentImage = '';
  String slug = '';

  Future<void> _loadSelectedCurrency() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedCurrency = prefs?.getString('selectedCurrency') ?? 'TND';
    });
  }

  @override
  void initState() {
    _loadSelectedCurrency();
    super.initState();
  }

  void scrollToTop() {
    scrollController.animateTo(0,
        duration: const Duration(seconds: 2), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: primaryGrey));
    return CommonScaffold(
      changeCurrency: _loadSelectedCurrency(),
      showFab: showFAB,
      backtotop: scrollToTop,
      scaffoldKey: _scaffoldKey,
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReservationSection(
                  dateDebut: widget.dateDebut,
                  dateFin: widget.dateFin,
                  address: widget.address,
                  nuits: widget.nuits,
                  adultes: widget.adultes,
                  rooms: widget.selectedRooms,
                  currency: selectedCurrency,
                  currencySymbol: currencies[selectedCurrency]['symbol'],
                  currencyValue: currencies[selectedCurrency]['value'],
                  total:
                      '${removeDecimalZeroFormat(currencies[selectedCurrency]['symbol'] != 'DT' ? currencyConverteur(currencies[selectedCurrency]['value']!, widget.total!) : currencyConverteur(currencies[selectedCurrency]['value']!, widget.total!))} ${currencies[selectedCurrency]['symbol']}/${widget.nuits} nuitées',

                  //   '${removeDecimalZeroFormat(currencies[widget.currencyName][widget.currency] != 'DT' ? currencyConverteur(widget.currencyValue!, widget.total!) : widget.total ?? "")} ${currencies[selectedCurrency]['symbol']}/ ${widget.nuits} nuitées',
                ),
                ReservationForm(
                  paysController: paysController,
                  controller: controller,
                  nameController: nameController,
                  emailController: emailController,
                  phoneController: phoneController,
                  messageController: messageController,
                  dateController: dateController,
                  villeController: villeController,
                ),
                PayementSection(
                  Checked: isChecked,
                  offline: offline,
                  onTermsChecked: (bool v) {
                    setState(() {
                      isChecked = v;
                    });
                  },
                  onOfflineChecked: (String v) {
                    setState(() {
                      offline = v == 'Offline';
                    });
                  },
                ),
                Container(
                  width: double.infinity,
                  padding:
                      EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.h),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 8.h),
                          elevation: 0,
                          primary: primaryOrange,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.r))),
                      onPressed: controller.text.isEmpty ||
                              nameController.text.isEmpty ||
                              phoneController.text.isEmpty ||
                              emailController.text.isEmpty ||
                              paysController.text.isEmpty ||
                              isChecked == false ||
                              offline == true && villeController.text.isEmpty
                          ? null
                          : () {
                              addHostToCart(
                                  widget.dateDebut ?? "",
                                  widget.dateFin ?? "",
                                  "0",
                                  widget.adultes ?? "0",
                                  widget.id,
                                  "",
                                  "host",
                                  [],
                                  widget.rooms ?? []);
                            },
                      child: Text(
                        'Soumettre',
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      )),
                ),
                Footer(),
                CreatedBy(),
                BackToTop(scrollToTop),
                SizedBox(height: 70),
              ],
            ),
          ),
          loading ? Center(child: CircularProgressIndicator()) : Container(),
        ],
      ),
    );
  }

  void addHostToCart(
    String dateStart,
    String dateEnd,
    String children,
    String adultes,
    String id,
    String promo_code,
    String service_type,
    List<String> extra_price,
    List rooms,
  ) async {
    setState(() {
      loading = true;
    });
    await _loadSelectedCurrency();

    HostCalls.AddHostToCart(dateStart, dateEnd, adultes, children, id, "",
            service_type, extra_price, rooms)
        .then((result) async {
      setState(() {
        print("result");
        print(result);
      });
      await Future.delayed(const Duration(milliseconds: 30));
      setState(() {
        loading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          "code : ${result['booking']['code']}",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
          ),
        ),
        backgroundColor: Colors.green,
      ));
    });
  }
}
