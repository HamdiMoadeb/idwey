import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:idwey/utils/colors.dart';

class ReservationForm extends StatefulWidget {
  final TextEditingController controller;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController villeController;
  final TextEditingController dateController;
  final TextEditingController messageController;
  final TextEditingController paysController;

  const ReservationForm({
    Key? key,
    required this.controller,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    required this.villeController,
    required this.dateController,
    required this.messageController,
    required this.paysController,
  }) : super(key: key);

  @override
  State<ReservationForm> createState() => _ReservationFormState();
}

class _ReservationFormState extends State<ReservationForm> {
  FocusNode focusNode = FocusNode();
  FocusNode nameFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode phoneFocusNode = FocusNode();
  FocusNode messageFocusNode = FocusNode();
  FocusNode dateFocusNode = FocusNode();
  FocusNode villeFocusNode = FocusNode();
  FocusNode paysFocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    focusNode.dispose();
    nameFocusNode.dispose();
    emailFocusNode.dispose();
    phoneFocusNode.dispose();
    messageFocusNode.dispose();
    dateFocusNode.dispose();
    villeFocusNode.dispose();
    paysFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16.h, right: 16.h, top: 16.h),
          child: Text(
            "Soumission de reservation",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.sp),
          ),
        ),
        Divider(),
        Column(
          children: [
            CustomInput(
              focusNode: focusNode,
              showRequired: true,
              hinText: "Prénom",
              label: "Prénom",
              controller: widget.controller,
              keyboardType: TextInputType.name,
            ),
            CustomInput(
              focusNode: nameFocusNode,
              showRequired: true,
              hinText: "Nom",
              label: "Nom",
              controller: widget.nameController,
              keyboardType: TextInputType.name,
            ),
            CustomInput(
              focusNode: emailFocusNode,
              showRequired: true,
              hinText: "Email",
              label: "Email",
              controller: widget.emailController,
              keyboardType: TextInputType.emailAddress,
            ),
            CustomInput(
              focusNode: phoneFocusNode,
              showRequired: true,
              hinText: "Téléphone",
              label: "Téléphone",
              controller: widget.phoneController,
              keyboardType: TextInputType.number,
            ),
            CustomInput(
              focusNode: villeFocusNode,
              hinText: "ville",
              label: "Ville",
              controller: widget.villeController,
              keyboardType: TextInputType.name,
            ),
            CountryInputfield(
              showRequired: true,
              controller: widget.paysController,
            ),
            CustomInput(
              focusNode: messageFocusNode,
              showRequired: true,
              hinText: 'Condition spéciale',
              label:
                  "Si vous voulez nous laisser un message à propos de votre réservation ou une condition spéciale, merci de bien",
              controller: widget.messageController,
              keyboardType: TextInputType.number,
            ),
          ],
        )
      ],
    );
  }
}

class CustomInput extends StatefulWidget {
  final String label;
  final String hinText;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final bool? showRequired;
  const CustomInput(
      {Key? key,
      required this.label,
      required this.controller,
      this.keyboardType,
      this.showRequired,
      required this.hinText,
      this.focusNode})
      : super(key: key);

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                color: materialPrimary,
                fontSize: 14.sp),
          ),
          SizedBox(
            height: 8.h,
          ),
          TextFormField(
            focusNode: widget.focusNode,
            onFieldSubmitted: (v) {
              FocusScope.of(context).unfocus();
            },
            enabled: true,
            keyboardType: widget.keyboardType ?? TextInputType.text,
            controller: widget.controller,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 8.h, vertical: 8.h),
              hintText: widget.hinText ?? "",
              hintStyle: TextStyle(fontSize: 14.sp, color: Colors.grey[400]!),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50.r),
                borderSide: BorderSide(color: Colors.grey[300]!, width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50.r),
                borderSide: BorderSide(color: Colors.grey[300]!, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50.r),
                borderSide: BorderSide(color: Colors.grey[300]!, width: 1),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CountryInputfield extends StatefulWidget {
  final bool? showRequired;
  final TextEditingController controller;
  const CountryInputfield(
      {Key? key, this.showRequired = false, required this.controller})
      : super(key: key);

  @override
  State<CountryInputfield> createState() => _CountryInputfieldState();
}

class _CountryInputfieldState extends State<CountryInputfield> {
  String countryName = "";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Pays",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: materialPrimary,
                    fontSize: 14.sp),
              ),
              Visibility(
                visible: widget.showRequired ?? false,
                child: Text(
                  "Pays",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: materialPrimary,
                      fontSize: 14.sp),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          InkWell(
            onTap: () {
              showCountryPicker(
                context: context,
                showPhoneCode:
                    true, // optional. Shows phone code before the country name.
                onSelect: (Country country) {
                  setState(() {
                    widget.controller.text = country.name;
                    countryName = country.name;
                  });
                },
              );
            },
            child: TextFormField(
              controller: widget.controller,
              enabled: false,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 8.h, vertical: 8.h),
                hintText: "country",
                hintStyle: TextStyle(fontSize: 14.sp, color: Colors.grey[400]!),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.r),
                  borderSide: BorderSide(color: Colors.grey[300]!, width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.r),
                  borderSide: BorderSide(color: Colors.grey[300]!, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.r),
                  borderSide: BorderSide(color: Colors.grey[300]!, width: 1),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
