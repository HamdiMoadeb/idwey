import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:idwey/utils/colors.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReservationForm extends StatefulWidget {
  final TextEditingController controller;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController villeController;
  final TextEditingController dateController;
  final TextEditingController messageController;
  final TextEditingController paysController;
  final GlobalKey<FormState>? formKey;

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
    this.formKey,
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
  SharedPreferences? prefs;

  @override
  void initState() {
    // TODO: implement initState
    getUser();
    super.initState();
  }

  getUser() async {
    prefs = await SharedPreferences.getInstance();
    String? token = prefs!.getString('token');
    if (token != null) {
      Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
      print("decodedToken");
      print(decodedToken);
      setState(() {
        widget.controller.text = decodedToken['first_name'];
        widget.nameController.text = decodedToken['last_name'];
        widget.emailController.text = decodedToken['email'];
      });
    }
  }

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
        Form(
          key: widget.formKey,
          child: Column(
            children: [
              CustomInput(
                focusNode: focusNode,
                showRequired: true,
                hinText: "Prénom",
                label: "Prénom",
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Prénom requis';
                  }
                  return null; // Return null for no validation error
                },
                controller: widget.controller,
                keyboardType: TextInputType.name,
              ),
              CustomInput(
                focusNode: nameFocusNode,
                showRequired: true,
                hinText: "Nom",
                label: "Nom",
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Nom requis';
                  }
                  return null; // Return null for no validation error
                },
                controller: widget.nameController,
                keyboardType: TextInputType.name,
              ),
              CustomInput(
                focusNode: emailFocusNode,
                showRequired: true,
                hinText: "Email",
                label: "Email",
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Email requis';
                  }
                  if (!RegExp(r"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$")
                      .hasMatch(value)) {
                    return 'Email invalide';
                  }
                  return null; // Return null for no validation error
                },
                controller: widget.emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              CustomInput(
                focusNode: phoneFocusNode,
                showRequired: true,
                hinText: "Téléphone",
                label: "Téléphone",
                errorText: (widget.phoneController.text.length < 8 ||
                        widget.phoneController.text.length > 13)
                    ? "Numéro doit etre entre 8 et 13 chiffres"
                    : null,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Numéro de téléphone requis';
                  }
                  if (value.length < 8 || value.length > 13) {
                    return 'Numéro de téléphone invalide , numéro doit etre entre 8 et 13 chiffres';
                  }
                  return null; // Return null for no validation error
                },
                controller: widget.phoneController,
                keyboardType: TextInputType.number,
              ),
              CustomInput(
                showRequired: true,
                focusNode: villeFocusNode,
                hinText: "Ville",
                label: "Ville",
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Ville requis';
                  }
                  return null; // Return null for no validation error
                },
                controller: widget.villeController,
                keyboardType: TextInputType.name,
              ),
              CountryInputfield(
                showRequired: true,
                controller: widget.paysController,
              ),
              CustomInput(
                focusNode: messageFocusNode,
                showRequired: false,
                hinText: 'Condition spéciale',
                label:
                    "Si vous voulez nous laisser un message à propos de votre réservation ou une condition spéciale, merci de bien",
                controller: widget.messageController,
                keyboardType: TextInputType.text,
              ),
            ],
          ),
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
  final Function(String)? validator;
  final String? errorText;
  const CustomInput(
      {Key? key,
      required this.label,
      required this.controller,
      this.keyboardType,
      required this.showRequired,
      required this.hinText,
      this.focusNode,
      this.validator,
      this.errorText})
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
            validator: (value) {
              return widget.validator?.call(value!);
            },
            decoration: InputDecoration(
              errorText: widget.showRequired! && widget.controller.text.isEmpty
                  ? "champ requis"
                  : widget.errorText,
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
          Text(
            "Pays",
            style: TextStyle(
                fontWeight: FontWeight.w500,
                color: materialPrimary,
                fontSize: 14.sp),
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
                hintText: "Pays",
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
