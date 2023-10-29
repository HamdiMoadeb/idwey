import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:idwey/constants/enums.dart';
import 'package:idwey/data/models/room_dto.dart';
import 'package:idwey/theme/app_colors.dart';

class ReservationSection extends StatefulWidget {
  final String? address;
  final String? url;
  final String? hostName;
  final String? region;
  final String? dateDebut;
  final String? dateFin;
  final String? nuits;
  final String? adultes;
  final String total;
  final String price;
  final List<Room>? rooms;
  final TypeReservation? typeReservation;
  final String? activityDuration;
  const ReservationSection(
      {Key? key,
      this.address,
      this.region,
      this.dateDebut,
      this.dateFin,
      this.nuits,
      this.adultes,
      required this.total,
      this.rooms,
      required this.hostName,
      required this.typeReservation,
      this.activityDuration,
      this.url,
      required this.price})
      : super(key: key);

  @override
  State<ReservationSection> createState() => _ReservationSectionState();
}

class _ReservationSectionState extends State<ReservationSection> {
  @override
  void initState() {
    // TODO: implement initState
    print('activity duration ${widget.activityDuration}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 16.h, vertical: 16.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: Colors.grey[300]!, width: 1),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16.h, right: 16.h),
              child: Text(
                "Votre réservation",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.sp),
              ),
            ),
            const Divider(
              thickness: 1,
            ),
            SizedBox(
              height: 16.h,
            ),
            widget.rooms?.isNotEmpty == true
                ? ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return _buildRoomItem(
                          widget.rooms?[index].imageId ?? "",
                          widget.rooms![index].title ?? "",
                          widget.address ?? "",
                          widget.dateDebut ?? "",
                          widget.dateFin ?? "",
                          widget.nuits ?? "",
                          widget.adultes ?? "",
                          (double.parse(widget.rooms![index].price!) *
                                      int.parse(widget.nuits ?? ""))
                                  .toInt()
                                  .toString() ??
                              "",
                          "",
                          widget.activityDuration);
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 16.h,
                      );
                    },
                    itemCount: widget.rooms?.length ?? 0)
                : Row(
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
                                placeholder: (context, url) => SizedBox(
                                    height: 40.h,
                                    width: 40.h,
                                    child: const CircularProgressIndicator()),
                                errorWidget: (context, url, error) =>
                                    const Icon(
                                      Icons.error,
                                      color: Colors.grey,
                                    ),
                                fit: BoxFit.cover,
                                imageUrl: widget.url ?? "")),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${widget.hostName} • ${widget.address}",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16.sp),
                            ),
                            SizedBox(
                              height: widget.dateDebut != "" ? 8.h : 0,
                            ),
                            widget.dateDebut != ""
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
                                        widget.dateDebut ?? "",
                                        style: TextStyle(
                                            color: primary,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  )
                                : const SizedBox.shrink(),
                            widget.dateFin != ""
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
                                        widget.dateFin ?? "",
                                        style: TextStyle(
                                            color: primary,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  )
                                : const SizedBox.shrink(),
                            Visibility(
                                visible: widget.activityDuration != null &&
                                    widget.activityDuration != "",
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Durée',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12.sp),
                                    ),
                                    Text(
                                      "${widget.activityDuration} H",
                                      style: TextStyle(
                                          color: primary,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                )),
                            Visibility(
                              visible: widget.nuits != null &&
                                  widget.nuits!.isNotEmpty &&
                                  widget.nuits != "0" &&
                                  widget.typeReservation ==
                                      TypeReservation.host,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Nuits',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12.sp),
                                  ),
                                  Text(
                                    widget.nuits ?? "",
                                    style: TextStyle(
                                        color: primary,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ),
                            Visibility(
                              visible: widget.typeReservation ==
                                  TypeReservation.product,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    widget.price.isEmpty == true
                                        ? const SizedBox.shrink()
                                        : Text(
                                            "${double.parse(widget.price ?? "0.00").toInt()} DT * ${widget.adultes} pièce",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12.sp),
                                          ),
                                    Text(
                                      widget.total ?? "",
                                      style: TextStyle(
                                          color: primary,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Visibility(
                              visible: !(widget.typeReservation ==
                                  TypeReservation.product),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    widget.typeReservation ==
                                            TypeReservation.host
                                        ? 'Adultes'
                                        : "Nombre",
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    widget.adultes ?? "",
                                    style: TextStyle(
                                        color: primary,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ),
                            if (widget.rooms != null)
                              for (var room in widget.rooms!)
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8.h),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          room.title ?? "",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12.sp),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 30.w,
                                      ),
                                      Text(
                                        "",

                                        // room.price ?? "",
                                        style: TextStyle(color: primary),
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
                                      color: primary),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
            widget.rooms?.isNotEmpty == true
                ? Column(
                    children: [
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 16.sp)),
                          Text(
                            "${getTotalPriceOfRooms(widget.rooms!).toString()} DT",
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: primary),
                          ),
                        ],
                      ),
                    ],
                  )
                : const SizedBox.shrink(),
          ],
        ));
  }

  int getTotalPriceOfRooms(List<Room> list) {
    double total = 0;
    for (var room in list) {
      total +=
          double.parse(room.price ?? "0") * double.parse(widget.nuits ?? "0");
    }
    return total.toInt();
  }

  Widget _buildRoomItem(
      String? url,
      String? hostName,
      String? address,
      String? dateDebut,
      String? dateFin,
      String? nuits,
      String? adultes,
      String? total,
      String? typeReservation,
      String? activityDuration) {
    return Row(
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
                  placeholder: (context, url) => SizedBox(
                      height: 40.h,
                      width: 40.h,
                      child: const CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(
                        Icons.error,
                        color: Colors.grey,
                      ),
                  fit: BoxFit.cover,
                  imageUrl: url ?? "")),
        ),
        SizedBox(
          width: 8.w,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$hostName • $address",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp),
              ),
              SizedBox(
                height: dateDebut != "" ? 8.h : 0,
              ),
              dateDebut != ""
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Date de début',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 12.sp),
                        ),
                        Text(
                          dateDebut ?? "",
                          style: TextStyle(
                              color: primary,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    )
                  : const SizedBox.shrink(),
              dateFin != ""
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Date de fin',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 12.sp),
                        ),
                        Text(
                          dateFin ?? "",
                          style: TextStyle(
                              color: primary,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    )
                  : const SizedBox.shrink(),
              Visibility(
                  visible: activityDuration != null,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Durée',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: materialPrimary,
                            fontSize: 12.sp),
                      ),
                      Text(
                        "$activityDuration H",
                        style: TextStyle(
                            color: primary,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  )),
              Visibility(
                visible: nuits != null && nuits.isNotEmpty,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Nuits',
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 12.sp),
                    ),
                    Text(
                      nuits ?? "",
                      style: TextStyle(
                          color: primary,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              Visibility(
                visible: !(widget.typeReservation == TypeReservation.product),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      typeReservation == TypeReservation.host
                          ? 'Adultes'
                          : "Nombre",
                      style: TextStyle(fontSize: 12.sp),
                    ),
                    Text(
                      adultes ?? "",
                      style: TextStyle(
                          color: primary,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
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
                    "$total DT",
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
    );
  }
}
