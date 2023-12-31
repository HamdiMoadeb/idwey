import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:idwey/app_router/app_router.dart';
import 'package:idwey/constants/assets.dart';
import 'package:idwey/data/models/booking_dto.dart';
import 'package:idwey/theme/app_colors.dart';
import 'package:intl/intl.dart';

class RoomItemCardBooking extends StatelessWidget {
  final BookingDto bookingDto;
  final bool confirmed;
  final VoidCallback? callback;
  const RoomItemCardBooking(
      {Key? key,
      required this.bookingDto,
      this.confirmed = false,
      this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback ?? () {},
      child: Stack(
        children: [
          confirmed
              ? Container(
                  alignment: Alignment.bottomCenter,
                  height: 300.h,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: primaryOrange,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 12.h),
                    child: InkWell(
                      onTap: () {
                        GetIt.I<AppRouter>()
                            .push(AddReviewRoute(id: "", type: ""));
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_circle_outline,
                            size: 24.sp,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Text(
                            "Ajouter votre avis",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : const SizedBox.shrink(),
          Card(
            shape: RoundedRectangleBorder(
              side: confirmed
                  ? BorderSide(color: primaryOrange, width: 1)
                  : const BorderSide(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(10.r),
            ),
            elevation: 0,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Type : ',
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                      children: <TextSpan>[
                        TextSpan(
                            text: getReservationType(
                                bookingDto.objectModel ?? ""),
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 16)),
                      ],
                    ),
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 150.h,
                        height: 150.h,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.r),
                            child: CachedNetworkImage(
                                placeholder: (context, url) => Image.asset(
                                      Assets.placeholder,
                                      fit: BoxFit.cover,
                                    ),
                                errorWidget: (context, url, error) =>
                                    Image.asset(
                                      Assets.placeholder,
                                      fit: BoxFit.cover,
                                    ),
                                fit: BoxFit.cover,
                                imageUrl: bookingDto.pervUrl ?? "")),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${bookingDto.title ?? ""} • ${bookingDto.address ?? ""}",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16.sp),
                            ),
                            SizedBox(
                              height: bookingDto.startDate != "" ? 8.h : 0,
                            ),
                            bookingDto.startDate != ""
                                ? Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Date de début',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12.sp),
                                      ),
                                      Text(
                                        DateFormat("dd/MM/yyyy").format(
                                                bookingDto.startDate ??
                                                    DateTime.now()) ??
                                            "",
                                        style: TextStyle(
                                            color: primary,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  )
                                : const SizedBox.shrink(),
                            bookingDto.endDate != ""
                                ? Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Date de fin',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12.sp),
                                      ),
                                      Text(
                                        DateFormat("dd/MM/yyyy").format(
                                                bookingDto.endDate ??
                                                    DateTime.now()) ??
                                            "",
                                        style: TextStyle(
                                            color: primary,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  )
                                : const SizedBox.shrink(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Nuits',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12.sp),
                                ),
                                Text(
                                  bookingDto.endDate
                                          ?.difference(bookingDto.startDate ??
                                              DateTime.now())
                                          .inDays
                                          .toString() ??
                                      "",
                                  style: TextStyle(
                                      color: primary,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                            bookingDto.totalGuests == "" ||
                                    bookingDto.totalGuests == "null" ||
                                    bookingDto.totalGuests == null
                                ? const SizedBox.shrink()
                                : Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Nombre",
                                        style: TextStyle(fontSize: 12.sp),
                                      ),
                                      Text(
                                        bookingDto.totalGuests.toString() ?? "",
                                        style: TextStyle(
                                            color: primary,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                            const Divider(),
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
                                  "${double.parse(bookingDto.total ?? "0.00").toInt()} DT",
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      color: primary),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Date la commande",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 16.sp),
                      ),
                      Text(
                        DateFormat("dd/MM/yyyy").format(
                                bookingDto.createdAt ?? DateTime.now()) ??
                            "",
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.w500),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  getReservationType(String type) {
    switch (type) {
      case "host":
        return "Hébergement";
      case "activity":
        return "Activité";
      case "event":
        return "Événement";
      case "Experience":
        return "Experience";
      default:
        return "";
    }
  }
}
