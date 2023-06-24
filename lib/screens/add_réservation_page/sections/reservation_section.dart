import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:idwey/models/room.dart';
import 'package:idwey/utils/colors.dart';
import 'package:idwey/utils/constants.dart';
import 'package:idwey/utils/utils.dart';

class ReservationSection extends StatefulWidget {
  final String? address;
  final String? region;
  final String? dateDebut;
  final String? dateFin;
  final String? nuits;
  final String? adultes;
  final String? total;
  final List<Room>? rooms;
  final int currencyValue;
  final String currencySymbol;
  final String currency;
  const ReservationSection(
      {Key? key,
      this.address,
      this.region,
      this.dateDebut,
      this.dateFin,
      this.nuits,
      this.adultes,
      this.total,
      this.rooms,
      required this.currencyValue,
      required this.currencySymbol,
      required this.currency})
      : super(key: key);

  @override
  State<ReservationSection> createState() => _ReservationSectionState();
}

class _ReservationSectionState extends State<ReservationSection> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16.h, right: 16.h, top: 16.h),
          child: Text(
            "Votre réservation",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.sp),
          ),
        ),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 16.h, vertical: 16.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.r),
              border: Border.all(color: Colors.grey[300]!, width: 1),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  "address",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: materialPrimary,
                      fontSize: 16.sp),
                ),
                Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.locationDot,
                      size: 14.sp,
                      color: grey,
                    ),
                    SizedBox(width: 10.w),
                    Text(widget.address ?? ""),
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                Divider(),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Date debut',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: materialPrimary,
                          fontSize: 14.sp),
                    ),
                    Text(
                      widget.dateDebut ?? "",
                      style: TextStyle(color: grey),
                    )
                  ],
                ),
                SizedBox(
                  height: 4.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Date Fin',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: materialPrimary,
                          fontSize: 14.sp),
                    ),
                    Text(
                      widget.dateFin ?? "",
                      style: TextStyle(color: grey),
                    )
                  ],
                ),
                SizedBox(
                  height: 4.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Nuits',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: materialPrimary,
                          fontSize: 14.sp),
                    ),
                    Text(
                      widget.nuits ?? "",
                      style: TextStyle(color: grey),
                    )
                  ],
                ),
                SizedBox(
                  height: 4.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Adultes',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: materialPrimary,
                          fontSize: 14.sp),
                    ),
                    Text(
                      widget.adultes ?? "",
                      style: TextStyle(color: grey),
                    )
                  ],
                ),
                Divider(),
                if (widget.rooms != null)
                  for (var room in widget.rooms!)
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              room.title ?? "",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: materialPrimary,
                                  fontSize: 14.sp),
                            ),
                          ),
                          SizedBox(
                            width: 30.w,
                          ),
                          Text(
                            '${removeDecimalZeroFormat(widget.currencySymbol != 'DT' ? currencyConverteur(widget.currencyValue!, getTotalPrice(room.price!, widget.nuits!)!) : currencyConverteur(widget.currencyValue!, getTotalPrice(room.price!, widget.nuits!)!))} ${widget.currencySymbol}/ ${widget.nuits!} nuitées',

                            // room.price ?? "",
                            style: TextStyle(color: grey),
                          )
                        ],
                      ),
                    ),
                Divider(),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: grey,
                          fontSize: 16.sp),
                    ),
                    Text(
                      widget.total ?? "",
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: primaryOrange),
                    ),
                  ],
                )
              ],
            )),
      ],
    );
  }
}
