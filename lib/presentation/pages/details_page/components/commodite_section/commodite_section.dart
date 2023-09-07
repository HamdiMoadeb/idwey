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
            padding: EdgeInsets.only(
              top: 10.h,
            ),
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
                    SizedBox(
                        height: 20.h,
                        width: 20.h,
                        child: SvgPicture.asset(Assets.shower)),
                    SizedBox(
                      width: 15.w,
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
          SizedBox(
            height: 5.h,
          ),
          parking == null || parking == ""
              ? const SizedBox.shrink()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                        height: 20.h,
                        width: 20.h,
                        child: SvgPicture.asset(Assets.parking)),
                    SizedBox(
                      width: 15.w,
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
          SizedBox(
            height: 5.h,
          ),
          kitchen == null || kitchen == ""
              ? const SizedBox.shrink()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                        height: 20.h,
                        width: 20.h,
                        child: SvgPicture.asset(Assets.kitchen)),
                    SizedBox(
                      width: 15.w,
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
          SizedBox(
            height: 5.h,
          ),
          food == null || food == ""
              ? const SizedBox.shrink()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20.h,
                      width: 20.h,
                      child: SvgPicture.asset(
                        Assets.food,
                        height: 16.h,
                        width: 16.h,
                      ),
                    ),
                    SizedBox(
                      width: 15.w,
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
          SizedBox(
            height: 5.h,
          ),
          games == null || games == ""
              ? const SizedBox.shrink()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20.h,
                      width: 20.h,
                      child: SvgPicture.asset(
                        Assets.videoGames,
                        height: 16.h,
                        width: 16.h,
                      ),
                    ),
                    SizedBox(
                      width: 15.w,
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
          // SizedBox(
          //   height: 5.h,
          // ),
          // breakfast == null || breakfast == ""
          //     ? const SizedBox.shrink()
          //     : Row(
          //         mainAxisAlignment: MainAxisAlignment.start,
          //         children: [
          //           SvgPicture.asset(
          //             Assets.breakfast,
          //             height: 20.h,
          //             width: 20.h,
          //           ),
          //           SizedBox(
          //             width: 5.w,
          //           ),
          //           Text(
          //             breakfast ?? "",
          //             style: Theme.of(context)
          //                 .textTheme
          //                 .bodySmall!
          //                 .copyWith(color: Colors.black),
          //           ),
          //         ],
          //       ),
        ],
      ),
    );
  }
}
