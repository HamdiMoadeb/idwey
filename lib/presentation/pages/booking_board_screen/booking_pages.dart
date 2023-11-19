import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:idwey/app_router/app_router.dart';
import 'package:idwey/components/room_item_card/room_item_card.dart';
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
                              return RoomItemCard(
                                bookingDto: state.bookingList?[index],
                                callback: () {
                                  GetIt.I<AppRouter>().push(
                                      DetailsReservationRoute(
                                          bookingDto:
                                              state.bookingList?[index]));
                                },
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
                              return RoomItemCard(
                                bookingDto: state.waitingBookingList?[index],
                                callback: () {
                                  GetIt.I<AppRouter>().push(
                                      DetailsReservationRoute(
                                          bookingDto: state
                                              .waitingBookingList?[index]));
                                },
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
                              return RoomItemCard(
                                bookingDto: state.canceledBookingList?[index],
                                callback: () {
                                  GetIt.I<AppRouter>().push(
                                      DetailsReservationRoute(
                                          bookingDto: state
                                              .canceledBookingList?[index]));
                                },
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
                              return RoomItemCard(
                                bookingDto: state.confirmedBookingList?[index],
                                callback: () {
                                  GetIt.I<AppRouter>().push(
                                      DetailsReservationRoute(
                                          bookingDto: state
                                              .confirmedBookingList?[index]));
                                },
                                confirmed: true,
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
                              return RoomItemCard(
                                bookingDto: state.paidBookingList?[index],
                                callback: () {
                                  GetIt.I<AppRouter>().push(
                                      DetailsReservationRoute(
                                          bookingDto:
                                              state.paidBookingList?[index]));
                                },
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
}
