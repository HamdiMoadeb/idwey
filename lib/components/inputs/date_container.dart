import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heroicons/heroicons.dart';
import 'package:idwey/theme/app_colors.dart';

class CustomDateContainer extends StatelessWidget {
  final String text;
  final String hintText;
  final HeroIcon icon;
  final Color borderColor;
  const CustomDateContainer(
      {Key? key,
      required this.text,
      required this.hintText,
      required this.icon,
      required this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.fromBorderSide(
          BorderSide(
            color: borderColor,
          ),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 10.w, top: 8.h, bottom: 8.h),
            child: icon,
          ),
          SizedBox(
            height: 56.h,
            child: const VerticalDivider(
              thickness: 1,
              color: Colors.black,
              width: 1,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.w, top: 8.h, bottom: 8.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hintText,
                  style: TextStyle(
                    color: primary,
                    fontSize: 16.sp,
                  ),
                ),
                Text(
                  text,
                  style: TextStyle(
                    color: Colors.black,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
