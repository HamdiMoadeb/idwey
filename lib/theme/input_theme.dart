import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';
import 'text_theme.dart';

InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(
      vertical: 20.h,
      horizontal: 16.w,
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 1,
        color: Colors.grey[300]!,
      ),
      borderRadius: BorderRadius.circular(8.r),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 1,
        color: Colors.grey[300]!,
      ),
      borderRadius: BorderRadius.circular(8.r),
    ),
    border: OutlineInputBorder(
      borderSide: const BorderSide(
        width: 1,
        color: Colors.black,
      ),
      borderRadius: BorderRadius.circular(8.r),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        width: 1,
        color: Colors.black,
      ),
      borderRadius: BorderRadius.circular(8.r),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 1,
        color: Colors.red[300]!,
      ),
      borderRadius: BorderRadius.circular(8.r),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 1,
        color: Colors.red[300]!,
      ),
      borderRadius: BorderRadius.circular(8.r),
    ),
    labelStyle: textTheme.bodySmall!.copyWith(color: grey),
    hintStyle: textTheme.bodySmall!.copyWith(color: grey),
    errorStyle: textTheme.bodySmall!
        .copyWith(fontSize: 12.sp, fontWeight: FontWeight.w500),
    errorMaxLines: 2,
    focusColor: Colors.black);

TextSelectionThemeData textSelectionTheme =
    const TextSelectionThemeData(cursorColor: Colors.black);
