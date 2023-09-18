import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heroicons/heroicons.dart';
import 'package:idwey/theme/app_colors.dart';

class SignUpTab3 extends StatelessWidget {
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final FocusNode passwordFocusNode;
  final FocusNode confirmPasswordFocusNode;
  const SignUpTab3(
      {Key? key,
      required this.passwordController,
      required this.confirmPasswordController,
      required this.passwordFocusNode,
      required this.confirmPasswordFocusNode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h),
          child: Text(
            "Verrouillez en toute confiance",
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: primary,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 12.w,
          ),
          child: const Divider(
            thickness: 2,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
          child: Text(
            "Créer votre mot de passe",
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Colors.black,
                fontSize: 24.sp,
                fontWeight: FontWeight.w700),
          ),
        ),
        TextField(
          decoration: InputDecoration(
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            border: InputBorder.none,
            hintText: "Mot de passe",
            hintStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Colors.grey[400],
                fontSize: 22.sp,
                fontWeight: FontWeight.w500),
            suffixIcon: Icon(
              Icons.visibility_off,
              color: Colors.grey[400],
            ),
          ),
        ),
        TextField(
          decoration: InputDecoration(
            suffixIcon: Icon(
              Icons.visibility_off,
              color: Colors.grey[400],
            ),
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            border: InputBorder.none,
            hintText: "Confirmez le mot de passe",
            hintStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Colors.grey[400],
                fontSize: 22.sp,
                fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
