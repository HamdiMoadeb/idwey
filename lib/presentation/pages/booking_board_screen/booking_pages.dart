import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:idwey/constants/enums.dart';
import 'package:idwey/presentation/blocs/booking_page_bloc/booking_page_bloc.dart';
import 'package:idwey/theme/app_colors.dart';
import 'package:intl/intl.dart';

class BoardPage extends StatefulWidget {
  const BoardPage({Key? key}) : super(key: key);

  @override
  State<BoardPage> createState() => _BoardPageState();
}

class _BoardPageState extends State<BoardPage> {
  final PageController controller = PageController();
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingPageBloc, BookingPageState>(
      builder: (context, state) {
        if (state.status == StateStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state.status == StateStatus.success) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// build filters horizontal scroll
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          controller.animateToPage(0,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.ease);
                          setState(() {
                            selectedIndex = 0;
                          });
                        },
                        child: Container(
                            margin: const EdgeInsets.only(left: 16),
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: selectedIndex == 0
                                        ? Colors.black
                                        : Colors.grey[400]!),
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              'Tous mes réservations',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: selectedIndex == 0
                                    ? Colors.black
                                    : Colors.grey[400]!,
                              ),
                            )),
                      ),
                      InkWell(
                        onTap: () {
                          controller.animateToPage(1,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.ease);
                          setState(() {
                            selectedIndex = 1;
                          });
                        },
                        child: Container(
                            margin: const EdgeInsets.only(left: 16),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: selectedIndex == 1
                                        ? Colors.black
                                        : Colors.grey[400]!),
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              'Traitement',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: selectedIndex == 1
                                    ? Colors.black
                                    : Colors.grey[400]!,
                              ),
                            )),
                      ),
                      InkWell(
                        onTap: () {
                          controller.animateToPage(2,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.ease);
                          setState(() {
                            selectedIndex = 2;
                          });
                        },
                        child: Container(
                            margin: const EdgeInsets.only(left: 16),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: selectedIndex == 2
                                        ? Colors.black
                                        : Colors.grey[400]!),
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              'Annulé',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: selectedIndex == 2
                                    ? Colors.black
                                    : Colors.grey[400]!,
                              ),
                            )),
                      ),
                      InkWell(
                        onTap: () {
                          controller.animateToPage(3,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.ease);
                          setState(() {
                            selectedIndex = 3;
                          });
                        },
                        child: Container(
                            margin: const EdgeInsets.only(left: 16),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: selectedIndex == 3
                                      ? Colors.black
                                      : Colors.grey[400]!,
                                ),
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              'Confirmé',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: selectedIndex == 3
                                    ? Colors.black
                                    : Colors.grey[400]!,
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ),

              const Divider(
                thickness: 1,
              ),
              Expanded(
                child: PageView(
                  controller: controller,
                  children: <Widget>[
                    state.bookingList?.isNotEmpty == true
                        ? ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return _buildRoomItem(
                                state.bookingList?[index].pervUrl ?? "",
                                state.bookingList?[index].title ?? "",
                                state.bookingList?[index].address ?? "",
                                DateFormat("dd/MM/yyyy").format(
                                    state.bookingList?[index].startDate ??
                                        DateTime.now()),
                                DateFormat("dd/MM/yyyy").format(
                                    state.bookingList?[index].startDate ??
                                        DateTime.now()),
                                DateFormat("dd/MM/yyyy").format(
                                    state.bookingList?[index].endDate ??
                                        DateTime.now()),
                                state.bookingList?[index].endDate
                                        ?.difference(state.bookingList?[index]
                                                .startDate ??
                                            DateTime.now())
                                        .inDays
                                        .toString() ??
                                    "",
                                state.bookingList?[index].totalGuests
                                        .toString() ??
                                    "",
                                double.parse(state.bookingList?[index].total ??
                                            "0")
                                        .toInt()
                                        .toString() ??
                                    "",
                                state.bookingList?[index].objectModel ?? "",
                                "",
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 16.h,
                              );
                            },
                            itemCount: state.bookingList?.length ?? 0)
                        : const Center(
                            child: Text("Aucune réservation"),
                          ),
                    state.waitingBookingList?.isNotEmpty == true
                        ? ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return _buildRoomItem(
                                state.waitingBookingList?[index].pervUrl ?? "",
                                state.waitingBookingList?[index].title ?? "",
                                state.waitingBookingList?[index].address ?? "",
                                DateFormat("dd/MM/yyyy").format(state
                                        .waitingBookingList?[index].startDate ??
                                    DateTime.now()),
                                DateFormat("dd/MM/yyyy").format(state
                                        .waitingBookingList?[index].startDate ??
                                    DateTime.now()),
                                DateFormat("dd/MM/yyyy").format(
                                    state.waitingBookingList?[index].endDate ??
                                        DateTime.now()),
                                state.waitingBookingList?[index].endDate
                                        ?.difference(state
                                                .waitingBookingList?[index]
                                                .startDate ??
                                            DateTime.now())
                                        .inDays
                                        .toString() ??
                                    "",
                                state.waitingBookingList?[index].totalGuests
                                        .toString() ??
                                    "",
                                double.parse(state.waitingBookingList?[index]
                                                .total ??
                                            "0")
                                        .toInt()
                                        .toString() ??
                                    "",
                                state.waitingBookingList?[index].objectModel ??
                                    "",
                                "",
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 16.h,
                              );
                            },
                            itemCount: state.waitingBookingList?.length ?? 0)
                        : const Center(
                            child: Text("Aucune réservation"),
                          ),
                    state.canceledBookingList?.isNotEmpty == true
                        ? ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return _buildRoomItem(
                                state.canceledBookingList?[index].pervUrl ?? "",
                                state.canceledBookingList?[index].title ?? "",
                                state.canceledBookingList?[index].address ?? "",
                                DateFormat("dd/MM/yyyy").format(state
                                        .canceledBookingList?[index]
                                        .startDate ??
                                    DateTime.now()),
                                DateFormat("dd/MM/yyyy").format(state
                                        .canceledBookingList?[index]
                                        .startDate ??
                                    DateTime.now()),
                                DateFormat("dd/MM/yyyy").format(
                                    state.canceledBookingList?[index].endDate ??
                                        DateTime.now()),
                                state.canceledBookingList?[index].endDate
                                        ?.difference(state
                                                .canceledBookingList?[index]
                                                .startDate ??
                                            DateTime.now())
                                        .inDays
                                        .toString() ??
                                    "",
                                state.canceledBookingList?[index].totalGuests
                                        .toString() ??
                                    "",
                                double.parse(state.canceledBookingList?[index]
                                                .total ??
                                            "0")
                                        .toInt()
                                        .toString() ??
                                    "",
                                state.canceledBookingList?[index].objectModel ??
                                    "",
                                "",
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 16.h,
                              );
                            },
                            itemCount: state.canceledBookingList?.length ?? 0)
                        : const Center(
                            child: Text("Aucune réservation"),
                          ),
                    state.confirmedBookingList?.isNotEmpty == true
                        ? ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return _buildRoomItem(
                                state.confirmedBookingList?[index].pervUrl ??
                                    "",
                                state.confirmedBookingList?[index].title ?? "",
                                state.confirmedBookingList?[index].address ??
                                    "",
                                DateFormat("dd/MM/yyyy").format(state
                                        .confirmedBookingList?[index]
                                        .startDate ??
                                    DateTime.now()),
                                DateFormat("dd/MM/yyyy").format(state
                                        .confirmedBookingList?[index]
                                        .startDate ??
                                    DateTime.now()),
                                DateFormat("dd/MM/yyyy").format(state
                                        .confirmedBookingList?[index].endDate ??
                                    DateTime.now()),
                                state.confirmedBookingList?[index].endDate
                                        ?.difference(state
                                                .confirmedBookingList?[index]
                                                .startDate ??
                                            DateTime.now())
                                        .inDays
                                        .toString() ??
                                    "",
                                state.confirmedBookingList?[index].totalGuests
                                        .toString() ??
                                    "",
                                double.parse(state.confirmedBookingList?[index]
                                                .total ??
                                            "0")
                                        .toInt()
                                        .toString() ??
                                    "",
                                state.confirmedBookingList?[index]
                                        .objectModel ??
                                    "",
                                "",
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 16.h,
                              );
                            },
                            itemCount: state.confirmedBookingList?.length ?? 0)
                        : const Center(
                            child: Text("Aucune réservation"),
                          ),
                  ],
                ),
              ),
            ],
          );
        }
        return const Center(child: SizedBox.shrink());
      },
    );
  }

  Widget _buildRoomItem(
      String? url,
      String? hostName,
      String? address,
      String? dateDebut,
      String? reservationDate,
      String? dateFin,
      String? nuits,
      String? adultes,
      String? total,
      String? typeReservation,
      String? activityDuration) {
    return Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.grey, width: 0.5),
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
                      text: getReservationType(typeReservation ?? ""),
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
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16.sp),
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
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12.sp),
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
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12.sp),
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
                      adultes == "" || adultes == "null" || adultes == null
                          ? const SizedBox.shrink()
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Nombre",
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
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Date la commande",
                  style:
                      TextStyle(fontWeight: FontWeight.w400, fontSize: 16.sp),
                ),
                Text(
                  reservationDate ?? "",
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                ),
              ],
            )
          ],
        ),
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
