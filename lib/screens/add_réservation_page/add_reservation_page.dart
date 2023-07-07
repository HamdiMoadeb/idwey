import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:idwey/models/room.dart';
import 'package:idwey/screens/add_r%C3%A9servation_page/sections/payement_section.dart';
import 'package:idwey/screens/add_r%C3%A9servation_page/sections/reservation_form.dart';
import 'package:idwey/screens/homePage.dart';
import 'package:idwey/services/activityCalls.dart';
import 'package:idwey/services/eventCalls.dart';
import 'package:idwey/services/experienceCalls.dart';
import 'package:idwey/services/productCalls.dart';
import 'package:idwey/utils/constants.dart';
import 'package:idwey/utils/enums.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../services/hostCalls.dart';
import '../../utils/colors.dart';
import '../../utils/utils.dart';
import '../../widgets/common/footer.dart';
import '../../widgets/common/scaffold.dart';
import 'sections/reservation_section.dart';

class AddReservationPage extends StatefulWidget {
  final String id;
  final String? address;
  final String? hostName;
  final String? region;
  final String? dateDebut;
  final String? dateFin;
  final String? nuits;
  final String? adultes;
  final String? total;
  final List? rooms;
  final TypeReservation? typeReservation;
  final List<Room>? selectedRooms;
  final int? currencyValue;
  final String? currencyName;
  final String? currency;
  final String? activityDuration;

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
      this.selectedRooms,
      required this.hostName,
      required this.typeReservation,
      this.activityDuration})
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
  String customer_id = "";

  Future<void> _loadSelectedCurrency() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedCurrency = prefs?.getString('selectedCurrency') ?? 'TND';
    });
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  getUser() async {
    prefs = await SharedPreferences.getInstance();
    String? token = prefs!.getString('token');
    if (token != null) {
      Map<String, dynamic> decodedToken = JwtDecoder.decode(token);

      setState(() {
        customer_id = decodedToken['id'].toString();
      });
    }
  }

  @override
  void initState() {
    _loadSelectedCurrency();
    getUser();
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
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReservationSection(
              typeReservation: widget.typeReservation,
              hostName: widget.hostName ?? "",
              dateDebut: widget.dateDebut,
              dateFin: widget.dateFin ?? '',
              address: widget.address!,
              nuits: widget.nuits,
              adultes: widget.adultes,
              rooms: widget.selectedRooms,
              currency: selectedCurrency,
              activityDuration: widget.activityDuration,
              currencySymbol: currencies[selectedCurrency]['symbol'],
              currencyValue: currencies[selectedCurrency]['value'],
              total:
                  '${removeDecimalZeroFormat(currencies[selectedCurrency]['symbol'] != 'DT' ? currencyConverteur(2, widget.total!) : currencyConverteur(currencies[selectedCurrency]['value']!, widget.total!))} ${currencies[selectedCurrency]['symbol']}',
            ),
            ReservationForm(
              formKey: _formKey,
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
              padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.h),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      elevation: 0,
                      primary: loading ? grey : primaryOrange,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.r))),
                  onPressed: controller.text.isEmpty ||
                          nameController.text.isEmpty ||
                          phoneController.text.isEmpty ||
                          emailController.text.isEmpty ||
                          paysController.text.isEmpty ||
                          _formKey.currentState!.validate() == false ||
                          isChecked == false ||
                          offline == false
                      ? null
                      : () {
                          addHostToCart(
                              widget.dateDebut ?? "",
                              widget.dateFin ?? "",
                              "0",
                              widget.adultes ?? "0",
                              widget.id,
                              "",
                              [],
                              widget.rooms ?? []);
                        },
                  child: loading
                      ? Center(child: CircularProgressIndicator())
                      : Text(
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
    );
  }

  void addHostToCart(
    String dateStart,
    String dateEnd,
    String children,
    String adultes,
    String id,
    String promo_code,
    List<String> extra_price,
    List rooms,
  ) async {
    setState(() {
      loading = true;
    });
    await _loadSelectedCurrency();
    if (widget.typeReservation == TypeReservation.host) {
      HostCalls.AddHostToCart(dateStart, dateEnd, adultes, children, id, "",
              'host', extra_price, rooms)
          .then((result) async {
        setState(() {
          print("result");
          print(result);
        });
        await Future.delayed(const Duration(milliseconds: 10));
        setState(() {
          loading = false;
        });
        validReservation(
            result['booking']['code'],
            customer_id,
            nameController.text,
            controller.text,
            phoneController.text,
            emailController.text,
            villeController.text,
            paysController.text,
            messageController.text,
            "offline_payment");
      });
    } else if (widget.typeReservation == TypeReservation.event) {
      EventCalls.AddEventToCart(
              dateStart, adultes, id, "", "event", extra_price)
          .then((result) async {
        setState(() {
          print("result");
          print(result);
        });
        await Future.delayed(const Duration(milliseconds: 10));
        setState(() {
          loading = false;
        });
        validReservation(
            result['booking']['code'],
            customer_id,
            nameController.text,
            controller.text,
            phoneController.text,
            emailController.text,
            villeController.text,
            paysController.text,
            messageController.text,
            "offline_payment");
      });
    } else if (widget.typeReservation == TypeReservation.activity) {
      ActivityCalls.AddActivityToCart(
              dateStart, adultes, id, "", 'activity', extra_price)
          .then((result) async {
        setState(() {
          print("result");
          print(result);
        });
        await Future.delayed(const Duration(milliseconds: 10));
        setState(() {
          loading = false;
        });
        validReservation(
            result['booking']['code'],
            customer_id,
            nameController.text,
            controller.text,
            phoneController.text,
            emailController.text,
            villeController.text,
            paysController.text,
            messageController.text,
            "offline_payment");
      });
    } else if (widget.typeReservation == TypeReservation.experience) {
      ExperienceCalls.AddExperienceToCart(
              dateStart, adultes, id, "", 'experience', extra_price)
          .then((result) async {
        setState(() {
          print("result");
          print(result);
        });
        await Future.delayed(const Duration(milliseconds: 10));
        setState(() {
          loading = false;
        });
        validReservation(
            result['booking']['code'],
            customer_id,
            nameController.text,
            controller.text,
            phoneController.text,
            emailController.text,
            villeController.text,
            paysController.text,
            messageController.text,
            "offline_payment");
      });
    } else if (widget.typeReservation == TypeReservation.product) {
      ProductCalls.AddProductToCart(adultes, id, "", 'product', extra_price)
          .then((result) async {
        setState(() {
          print("result");
          print(result);
        });
        await Future.delayed(const Duration(milliseconds: 10));
        setState(() {
          loading = false;
        });
        validReservation(
            result['booking']['code'],
            customer_id,
            nameController.text,
            controller.text,
            phoneController.text,
            emailController.text,
            villeController.text,
            paysController.text,
            messageController.text,
            "offline_payment");
      });
    }
  }

  void validReservation(
    String? code,
    String? customerId,
    String? firstName,
    String? lastName,
    String? phone,
    String? email,
    String? city,
    String? country,
    String? customNotes,
    String? paymentMethod,
  ) async {
    setState(() {
      loading = true;
    });
    await _loadSelectedCurrency();

    HostCalls.validReservation(
            code: code,
            customerId: customerId,
            firstName: firstName,
            lastName: lastName,
            phone: phone,
            email: email,
            city: city,
            country: country,
            customNotes: customNotes,
            paymentMethod: paymentMethod)
        .then((result) async {
      setState(() {
        print("result");
        print(result);
      });
      //await Future.delayed(const Duration(milliseconds: 10));
      setState(() {
        loading = false;
      });
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          "Votre réservation a été validée!",
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
