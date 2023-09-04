import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idwey/constants/assets.dart';
import 'package:idwey/constants/enums.dart';

class CommoditiesSection extends StatelessWidget {
  final TypeReservation typeReservation;
  final String? shower;
  final String? parking;
  final String? kitchen;
  final String? wifi;
  final String? breakfast;
  final String? food;
  final String? games;
  const CommoditiesSection(
      {Key? key,
      required this.typeReservation,
      this.shower,
      this.parking,
      this.kitchen,
      this.wifi,
      this.breakfast,
      this.food,
      this.games})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20.h, bottom: 10.h),
            child: Text(
              'Commodités',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.w500),
            ),
          ),
          shower == null || shower == ""
              ? const SizedBox.shrink()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(Assets.shower),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      shower ?? "",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.black),
                    ),
                  ],
                ),
          parking == null || parking == ""
              ? const SizedBox.shrink()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(Assets.parking),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      parking ?? "",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.black),
                    ),
                  ],
                ),
          kitchen == null || kitchen == ""
              ? const SizedBox.shrink()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(Assets.kitchen),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      'Cuisine équipée',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.black),
                    ),
                  ],
                ),
          food == null || food == ""
              ? const SizedBox.shrink()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      Assets.food,
                      height: 16.h,
                      width: 16.h,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      food ?? "",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.black),
                    ),
                  ],
                ),
          breakfast == null || breakfast == ""
              ? const SizedBox.shrink()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      Assets.breakfast,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      breakfast ?? "",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.black),
                    ),
                  ],
                ),
          games == null || games == ""
              ? const SizedBox.shrink()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      Assets.videoGames,
                      height: 16.h,
                      width: 16.h,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      games ?? "",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.black),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
