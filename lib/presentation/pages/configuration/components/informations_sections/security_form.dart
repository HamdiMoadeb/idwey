import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:idwey/components/buttons/button.dart';
import 'package:idwey/components/inputs/custom_input.dart';
import 'package:idwey/theme/app_colors.dart';

class SecurityForm extends StatefulWidget {
  final TextEditingController oldPasswordController;
  final TextEditingController newPasswordController;
  final TextEditingController confirmPasswordController;

  const SecurityForm({
    Key? key,
    required this.oldPasswordController,
    required this.newPasswordController,
    required this.confirmPasswordController,
  }) : super(key: key);

  @override
  State<SecurityForm> createState() => _SecurityFormState();
}

class _SecurityFormState extends State<SecurityForm> {
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
            hintText: "Mot de passe actuel",
            foregroundColor: Colors.grey,
            controller: widget.oldPasswordController,
            keyboardType: TextInputType.name,
          ),
          SizedBox(
            height: 16.h,
          ),
          CustomInput(
            focusNode: nameFocusNode,
            hintText: "Nouveau Mot de Passe",
            foregroundColor: Colors.grey,
            controller: widget.newPasswordController,
            keyboardType: TextInputType.name,
          ),
          SizedBox(
            height: 16.h,
          ),
          CustomInput(
            focusNode: emailFocusNode,
            hintText: "Nouveau Mot de Passe encore",
            controller: widget.confirmPasswordController,
            keyboardType: TextInputType.emailAddress,
            foregroundColor: Colors.grey,
          ),
          SizedBox(
            height: 16.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton.primary(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
                    child: const Text("Changer le mot de passe"),
                  ),
                  onPressed: () {}),
              InkWell(
                onTap: () {
                  widget.oldPasswordController.clear();
                  widget.newPasswordController.clear();
                  widget.confirmPasswordController.clear();
                },
                child: Text("Annuler",
                    style: TextStyle(
                      color: primary,
                      decoration: TextDecoration.underline,
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
