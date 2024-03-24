import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:idwey/theme/app_colors.dart';

class SignUpTab1 extends StatelessWidget {
  final TextEditingController nameController;
  final FocusNode focusNode;
  const SignUpTab1(
      {Key? key, required this.nameController, required this.focusNode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h),
          child: Text(
            "En quelques clic, on y est presque",
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                  color: primary,
                  fontSize: 24.sp,
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
            "Quel est votre nom ?",
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Colors.black,
                fontSize: 24.sp,
                fontWeight: FontWeight.w700),
          ),
        ),
        TextField(
          controller: nameController,
          decoration: InputDecoration(
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            border: InputBorder.none,
            hintText: "Ajoutez votre nom complet",
            hintStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Colors.grey[400],
                fontSize: 22.sp,
                fontWeight: FontWeight.w500),
          ),
        )
      ],
    );
  }
}
