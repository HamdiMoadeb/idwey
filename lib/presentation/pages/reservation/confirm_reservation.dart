import 'package:auto_route/annotations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idwey/constants/assets.dart';
import 'package:idwey/constants/enums.dart';
import 'package:idwey/presentation/blocs/reservation_bloc/reservation_bloc.dart';
import 'package:idwey/presentation/pages/assurance/assurance_page.dart';
import 'package:idwey/presentation/pages/details_page/components/chalets_section/chalets_section.dart';
import 'package:idwey/presentation/pages/reservation/sections/assurance_section.dart';
import 'package:idwey/theme/app_colors.dart';

import 'sections/payment_section.dart';
import 'sections/reservation_form.dart';
import 'sections/reservation_section.dart';

@RoutePage()
class ConfirmReservationScreen extends StatefulWidget {
  final String id;
  final String url;
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
  final int? currencyValue;
  final String? currencyName;
  final String? currency;
  final String? activityDuration;
  const ConfirmReservationScreen(
      {Key? key,
      required this.id,
      this.address,
      this.hostName,
      this.region,
      this.dateDebut,
      this.dateFin,
      this.nuits,
      this.adultes,
      this.total,
      this.rooms,
      this.typeReservation,
      this.currencyValue,
      this.currencyName,
      this.currency,
      this.activityDuration,
      required this.url})
      : super(key: key);

  @override
  State<ConfirmReservationScreen> createState() =>
      _ConfirmReservationScreenState();
}

class _ConfirmReservationScreenState extends State<ConfirmReservationScreen> {
  TextEditingController controller = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController villeController = TextEditingController();
  TextEditingController paysController = TextEditingController();
  bool isChecked = false;
  bool offline = false;
  bool online = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    context.read<ReservationBloc>().add(const ReservationEvent.getUser());
    setState(() {
      nameController.text = context.read<ReservationBloc>().state.name ?? "";
      emailController.text = context.read<ReservationBloc>().state.email ?? "";
      phoneController.text = context.read<ReservationBloc>().state.phone ?? "";
      controller.text = context.read<ReservationBloc>().state.lastname ?? "";
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[200],
          elevation: 0,
          leading: Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: materialPrimary.withOpacity(0.8),
                borderRadius: BorderRadius.circular(50)),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
          centerTitle: true,
          bottom: const PreferredSize(
              child: Divider(
                thickness: 1,
                height: 1,
              ),
              preferredSize: Size.fromHeight(16.0)),
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.h),
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
                        _formKey.currentState!.validate() == false ||
                        isChecked == false ||
                        offline == false
                    ? null
                    : () {},
                child: Text(
                  'Confirmer la réservation',
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                )),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ReservationSection(
                url: widget.url,
                typeReservation: widget.typeReservation,
                hostName: widget.hostName ?? "",
                dateDebut: widget.dateDebut ?? "",
                dateFin: widget.dateFin ?? '',
                address: widget.address ?? "",
                nuits: widget.nuits,
                adultes: widget.adultes,
                // rooms: widget.selectedRooms,
                activityDuration: widget.activityDuration,
                total: " ${widget.total} DT",
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
              const AssuranceSection(),
              PayementSection(
                Checked: isChecked,
                offline: offline,
                online: online,
                onOnlineChecked: (String v) {
                  setState(() {
                    online = v == "Online";
                  });
                },
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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    value: isChecked,
                    onChanged: (bool? value) {
                      // onTermsChecked!(value!);
                      // setState(() {
                      //   isChecked = value;
                      //   widget.Checked = isChecked;
                      // });
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16.h),
                    child: RichText(
                      text: TextSpan(
                        text: 'J\'ai lu et j\'accepte ',
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' les Termes et conditions.\n',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // final Uri uri = Uri.parse(Urls.TERMS_URL);
                                // launchUrl(uri);
                              },
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 13.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.left,
                      textHeightBehavior: TextHeightBehavior(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
