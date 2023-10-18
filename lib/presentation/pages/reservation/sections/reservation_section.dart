import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:idwey/components/buttons/button.dart';
import 'package:idwey/components/inputs/custom_input.dart';
import 'package:idwey/presentation/blocs/confirm_reservation_bloc/confirm_reservation_bloc.dart';
import 'package:idwey/presentation/blocs/reservation_bloc/reservation_bloc.dart';
import 'package:idwey/theme/app_colors.dart';
import 'package:idwey/utils/form_utils.dart';

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
    return BlocBuilder<ConfirmReservationBloc, ConfirmReservationState>(
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 16.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: Colors.grey[300]!),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 16.h, right: 16.h),
                  child: Text(
                    "Vos informations",
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 18.sp),
                  ),
                ),
                const Divider(),
                Form(
                  key: widget.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 0.4.sw,
                            child: CustomInput(
                              focusNode: focusNode,
                              enabled: true,
                              hintText: "Prénom",
                              foregroundColor: Colors.grey,
                              controller: widget.controller,
                              errorText: state.validInformations == false &&
                                      widget.controller.text.isEmpty
                                  ? "Veuillez remplir ce champ"
                                  : null,
                              keyboardType: TextInputType.name,
                            ),
                          ),
                          SizedBox(
                            width: 0.4.sw,
                            child: CustomInput(
                              focusNode: nameFocusNode,
                              hintText: "Nom",
                              enabled: true,
                              errorText: state.validInformations == false &&
                                      widget.nameController.text.isEmpty
                                  ? "Veuillez remplir ce champ"
                                  : null,
                              foregroundColor: Colors.grey,
                              controller: widget.nameController,
                              keyboardType: TextInputType.name,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      CustomInput(
                        focusNode: emailFocusNode,
                        hintText: "Email",
                        controller: widget.emailController,
                        errorText: widget.emailController.text.isEmpty
                            ? "Email est requis"
                            : FormsUtils()
                                    .isEmailValid(widget.emailController.text)
                                ? null
                                : "Email est invalide",
                        keyboardType: TextInputType.emailAddress,
                        enabled: true,
                        foregroundColor: Colors.grey,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 0.4.sw,
                            child: CustomInput(
                              focusNode: phoneFocusNode,
                              hintText: "Numéro de téléphone",
                              controller: widget.phoneController,
                              // errorText: widget.phoneController.text.isEmpty
                              //     ? "Numéro de téléphone est requis"
                              //     : FormsUtils().isPhoneNumberValid(
                              //             widget.phoneController.text)
                              //         ? null
                              //         : "Numéro de téléphone est invalide",
                              keyboardType: TextInputType.number,
                              enabled: true,
                              foregroundColor: Colors.grey,
                            ),
                          ),
                          SizedBox(
                            width: 0.4.sw,
                            child: CustomInput(
                              focusNode: villeFocusNode,
                              hintText: "Ville",
                              controller: widget.villeController,
                              // errorText: state.validInformations == false
                              //     ? "Veuillez remplir ce champ"
                              //     : null,
                              keyboardType: TextInputType.name,
                              enabled: true,
                              foregroundColor: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      CustomInput(
                        maxLines: 20,
                        focusNode: messageFocusNode,
                        hintText: 'Condition spéciale',
                        controller: widget.messageController,
                        keyboardType: TextInputType.text,
                        enabled: true,
                        foregroundColor: Colors.grey,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class CountryInputfield extends StatefulWidget {
  final bool? showRequired;
  final TextEditingController controller;
  final Function(String)? validator;
  final String? errorText;

  const CountryInputfield({
    Key? key,
    this.showRequired = false,
    required this.controller,
    this.errorText,
    this.validator,
  }) : super(key: key);

  @override
  State<CountryInputfield> createState() => _CountryInputfieldState();
}

class _CountryInputfieldState extends State<CountryInputfield> {
  String countryName = "Tunisia";

  @override
  void initState() {
    // TODO: implement initState
    widget.controller.text = countryName;
    super.initState();
  }

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
              widget.showRequired == true
                  ? Text(
                      "*",
                      style: TextStyle(color: primaryOrange, fontSize: 14.sp),
                    )
                  : Container(),
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
              validator: (value) {
                return widget.validator?.call(value!);
              },
              decoration: InputDecoration(
                errorText:
                    widget.showRequired! && widget.controller.text.isEmpty
                        ? "champ requis"
                        : widget.errorText,
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
