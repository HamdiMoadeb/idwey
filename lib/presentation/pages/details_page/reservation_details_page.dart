import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:heroicons/heroicons.dart';
import 'package:idwey/app_router/app_router.dart';
import 'package:idwey/data/models/booking_dto.dart';
import 'package:idwey/theme/app_colors.dart';
import 'package:intl/intl.dart';

@RoutePage()
class DetailsReservationScreen extends StatefulWidget {
  final BookingDto? bookingDto;
  const DetailsReservationScreen({Key? key, required this.bookingDto})
      : super(key: key);

  @override
  State<DetailsReservationScreen> createState() =>
      _DetailsReservationScreenState();
}

class _DetailsReservationScreenState extends State<DetailsReservationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Details Reservation",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: materialPrimary, borderRadius: BorderRadius.circular(50)),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(20),
          child: Divider(
            thickness: 1,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Padding(
          //   padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
          //   child: Text(
          //     "Identifiant de la reservation",
          //     style: TextStyle(
          //       fontSize: 16.sp,
          //     ),
          //   ),
          // ),
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 16.w),
          //   child: Row(
          //     children: [
          //       Text(
          //         "#" + widget.bookingDto!.id.toString(),
          //         style: TextStyle(
          //           fontWeight: FontWeight.w500,
          //           fontSize: 16.sp,
          //         ),
          //       ),
          //       const SizedBox(
          //         width: 8,
          //       ),
          //       const Icon(Icons.copy),
          //     ],
          //   ),
          // ),
          // SizedBox(
          //   height: 16.h,
          // ),
          buildStatusBar(widget.bookingDto?.status ?? ""),
          Expanded(
            child: DefaultTabController(
              initialIndex: 0,
              length: 2,
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  automaticallyImplyLeading: false,
                  title: const TabBar(
                    indicatorColor: Colors.black,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    tabs: <Widget>[
                      Tab(
                        text: "Détail de la réservation",
                      ),
                      Tab(
                        text: "Vos informations",
                      ),
                    ],
                  ),
                ),
                body: TabBarView(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 8.h, horizontal: 16.w),
                          child: Text(
                            "${widget.bookingDto!.title ?? ""} • ${widget.bookingDto!.address ?? ""}",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 18.sp),
                          ),
                        ),
                        const Divider(
                          thickness: 1,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 8.h, horizontal: 16.w),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.calendar_month_outlined,
                                size: 20,
                              ),
                              SizedBox(
                                width: 16.w,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${DateFormat("dd/MM/yyyy").format(widget.bookingDto!.startDate ?? DateTime.now())} • ${DateFormat("dd/MM/yyyy").format(widget.bookingDto!.endDate ?? DateTime.now())}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                  const Text("Arrivée : entre 12:00 et 20:00"),
                                  const Text("Départ : entre 11:00 et 11:30"),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 8.h, horizontal: 16.w),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.pin_drop_outlined,
                                size: 20,
                              ),
                              SizedBox(
                                width: 16.w,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Adresse de l’établissement",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                      "${widget.bookingDto?.address ?? ""} ${widget.bookingDto?.city ?? ""} Tunisia"),
                                  // Text(
                                  //   "Obtenir l'itinéraire",
                                  //   style: TextStyle(
                                  //       color: primary,
                                  //       decoration: TextDecoration.underline),
                                  // ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.people_outline,
                                size: 20,
                              ),
                              SizedBox(
                                width: 16.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Vos invités",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                      "${widget.bookingDto?.totalGuests} adultes"),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          thickness: 1,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Total"),
                              Text(
                                "${double.parse(widget.bookingDto?.total ?? "0.00").toInt()} DT",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: primary,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        _buildInfoItem(
                            title: "Nom",
                            value: widget.bookingDto?.firstName ?? ""),
                        const Divider(
                          thickness: 1,
                        ),
                        _buildInfoItem(
                            title: "Prénom",
                            value: widget.bookingDto?.lastName ?? ""),
                        const Divider(
                          thickness: 1,
                        ),
                        _buildInfoItem(
                            title: "Email",
                            value: widget.bookingDto?.email ?? ""),
                        const Divider(
                          thickness: 1,
                        ),
                        _buildInfoItem(
                            title: "Téléphone",
                            value: widget.bookingDto?.phone ?? ""),
                        const Divider(
                          thickness: 1,
                        ),
                        _buildInfoItem(
                            title: "Ville",
                            value: widget.bookingDto?.city ?? ""),

                        const Divider(
                          thickness: 1,
                        ),
                       widget.bookingDto?.customerNotes == "" ||widget.bookingDto?.customerNotes == null ? SizedBox():_buildInfoItem(
                            title: "Condition special",
                            value: widget.bookingDto?.customerNotes ?? ""),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          widget.bookingDto?.status == "confirmed"
              ? buildReviewBar()
              : const SizedBox.shrink(),
        ],
      ),
    );
  }

  _buildInfoItem({required String title, required String value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          Text(value),
        ],
      ),
    );
  }

  buildStatusBar(String status) {
    print(status);
    print("stataus");
    if (status == "cancelled") {
      return Container(
          width: double.infinity,
          height: 25.h,
          decoration: const BoxDecoration(
            color: Colors.red,
          ),
          child: Center(
            child: Text(
              "Le statut de la réservation : Annulé",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.white,
              ),
            ),
          ));
    } else if (status == "processing") {
      return Container(
          width: double.infinity,
          height: 25.h,
          decoration: const BoxDecoration(
            color: Colors.yellow,
          ),
          child: Center(
            child: Text(
              "Le statut de la réservation : traitement en cours",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.black,
              ),
            ),
          ));
    } else if (status == "paid") {
      return Container(
          width: double.infinity,
          height: 25.h,
          decoration: const BoxDecoration(
            color: Colors.green,
          ),
          child: Center(
            child: Text(
              "Le statut de la réservation : Payé",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.white,
              ),
            ),
          ));
    }

    return Container(
        width: double.infinity,
        height: 25.h,
        decoration: const BoxDecoration(
          color: Colors.green,
        ),
        child: Center(
          child: Text(
            "Le statut de la réservation : Confirmé",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.white,
            ),
          ),
        ));
  }

  buildReviewBar() {
    return InkWell(
      onTap: () {
        GetIt.I<AppRouter>().push(AddReviewRoute(
          id: widget.bookingDto?.id.toString() ?? "",
          type: "booking",
        ));
      },
      child: Container(
          width: double.infinity,
          height: 40.h,
          decoration: BoxDecoration(
            color: primaryOrange,
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HeroIcon(
                  HeroIcons.chatBubbleLeftEllipsis,
                  color: Colors.white,
                  size: 24.sp,
                ),
                SizedBox(
                  width: 8.w,
                ),
                Text(
                  "Ajouter votre avis",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
