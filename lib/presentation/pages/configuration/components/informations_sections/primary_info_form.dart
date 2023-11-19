import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:idwey/components/inputs/custom_input.dart';
import 'package:idwey/utils/form_utils.dart';

class PrimaryInfoForm extends StatefulWidget {
  final TextEditingController controller;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;

  const PrimaryInfoForm({
    Key? key,
    required this.controller,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
  }) : super(key: key);

  @override
  State<PrimaryInfoForm> createState() => _PrimaryInfoFormState();
}

class _PrimaryInfoFormState extends State<PrimaryInfoForm> {
  FocusNode focusNode = FocusNode();
  FocusNode nameFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode phoneFocusNode = FocusNode();

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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
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
                  hintText: "Prénom",
                  foregroundColor: Colors.grey,
                  controller: widget.controller,
                  errorText: widget.controller.text.isEmpty
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
                  errorText: widget.nameController.text.isEmpty
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
            errorText: FormsUtils().isEmailValid(widget.emailController.text)
                ? null
                : "Email est invalide",
            keyboardType: TextInputType.emailAddress,
            foregroundColor: Colors.grey,
          ),
          SizedBox(
            height: 16.h,
          ),
          CustomInput(
            focusNode: phoneFocusNode,
            hintText: "Numéro de téléphone",
            controller: widget.phoneController,
            keyboardType: TextInputType.number,
            foregroundColor: Colors.grey,
          ),
        ],
      ),
    );
  }
}
