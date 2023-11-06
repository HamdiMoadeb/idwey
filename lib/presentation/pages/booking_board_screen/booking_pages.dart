import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:idwey/app_router/app_router.dart';
import 'package:idwey/constants/enums.dart';
import 'package:idwey/data/models/booking_dto.dart';
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
                      InkWell(
                        onTap: () {
                          controller.animateToPage(4,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.ease);
                          setState(() {
                            selectedIndex = 4;
                          });
                        },
                        child: Container(
                            margin: const EdgeInsets.only(left: 16),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: selectedIndex == 4
                                      ? Colors.black
                                      : Colors.grey[400]!,
                                ),
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              'Payé',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: selectedIndex == 4
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
                                bookingDto: state.bookingList?[index],
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
                                bookingDto: state.waitingBookingList?[index],
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
                                bookingDto: state.canceledBookingList?[index],
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
                                bookingDto: state.confirmedBookingList?[index],
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
                    state.paidBookingList?.isNotEmpty == true
                        ? ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return _buildRoomItem(
                                bookingDto: state.paidBookingList?[index],
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 16.h,
                              );
                            },
                            itemCount: state.paidBookingList?.length ?? 0)
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

  Widget _buildRoomItem({BookingDto? bookingDto}) {
    return InkWell(
      onTap: () {
        GetIt.I<AppRouter>()
            .push(DetailsReservationRoute(bookingDto: bookingDto));
      },
      child: Card(
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
                        text: getReservationType(bookingDto?.objectModel ?? ""),
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
                            imageUrl: bookingDto?.pervUrl ?? "")),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${bookingDto?.title ?? ""} • ${bookingDto?.address ?? ""}",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 16.sp),
                        ),
                        SizedBox(
                          height: bookingDto?.startDate != "" ? 8.h : 0,
                        ),
                        bookingDto?.startDate != ""
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
                                            bookingDto?.startDate ??
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
                        bookingDto?.endDate != ""
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
                                            bookingDto?.endDate ??
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
                                  fontWeight: FontWeight.w400, fontSize: 12.sp),
                            ),
                            Text(
                              bookingDto?.endDate
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
                        bookingDto?.totalGuests == "" ||
                                bookingDto?.totalGuests == "null" ||
                                bookingDto?.totalGuests == null
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
                                    bookingDto?.totalGuests.toString() ?? "",
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
                              "${double.parse(bookingDto?.total ?? "0.00").toInt()} DT",
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
                    DateFormat("dd/MM/yyyy")
                            .format(bookingDto?.createdAt ?? DateTime.now()) ??
                        "",
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                  ),
                ],
              )
            ],
          ),
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
