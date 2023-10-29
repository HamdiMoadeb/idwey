import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:idwey/components/inputs/custom_input.dart';

class SecondaryInfoForm extends StatefulWidget {
  final TextEditingController professionController;
  final TextEditingController interestsController;
  final TextEditingController aboutController;

  const SecondaryInfoForm({
    Key? key,
    required this.professionController,
    required this.interestsController,
    required this.aboutController,
  }) : super(key: key);

  @override
  State<SecondaryInfoForm> createState() => _SecondaryInfoFormState();
}

class _SecondaryInfoFormState extends State<SecondaryInfoForm> {
  FocusNode focusNode = FocusNode();
  FocusNode nameFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();

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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomInput(
            focusNode: focusNode,
            enabled: true,
            hintText: "Profession",
            foregroundColor: Colors.grey,
            controller: widget.professionController,
            keyboardType: TextInputType.name,
          ),
          SizedBox(
            height: 16.h,
          ),
          CustomInput(
            focusNode: nameFocusNode,
            hintText: "Intérêts",
            enabled: true,
            foregroundColor: Colors.grey,
            controller: widget.interestsController,
            keyboardType: TextInputType.name,
          ),
          SizedBox(
            height: 16.h,
          ),
          CustomInput(
            focusNode: emailFocusNode,
            hintText: "Parlez de vous-même",
            controller: widget.aboutController,
            keyboardType: TextInputType.emailAddress,
            enabled: true,
            foregroundColor: Colors.grey,
          ),
        ],
      ),
    );
  }
}
