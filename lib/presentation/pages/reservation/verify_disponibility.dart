import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:idwey/components/bottom_bar.dart';
import 'package:idwey/components/inputs/date_input.dart';
import 'package:idwey/constants/enums.dart';
import 'package:idwey/data/models/extra_price_dto.dart';
import 'package:idwey/data/models/room_dto.dart';
import 'package:idwey/presentation/blocs/reservation_bloc/reservation_bloc.dart';
import 'package:idwey/presentation/pages/details_page/components/product_page_header/product_page_header.dart';
import 'package:idwey/presentation/pages/reservation/sections/chalets_section.dart';
import 'package:idwey/theme/app_colors.dart';
import 'package:intl/intl.dart';

import 'sections/extra_price_section.dart';

@RoutePage()
class VerifyDisponibilityScreen extends StatefulWidget
    implements AutoRouteWrapper {
  final TypeReservation typeReservation;
  final String? activityDuration;
  final List<ExtraPrice>? extraPrice;
  final String id;
  final String url;
  final String title;
  final String address;
  final String? typeHost;
  final String? salePrice;
  final String? perPerson;
  final int? minNuits;
  final String? price;
  final String? subtitle;
  final List<Room>? rooms;
  final DateTime? startDate;
  final DateTime? endDate;

  const VerifyDisponibilityScreen(
      {Key? key,
      required this.typeReservation,
      this.activityDuration,
      required this.id,
      required this.title,
      required this.address,
      this.typeHost,
      this.salePrice,
      this.perPerson,
      this.minNuits,
      this.price,
      required this.url,
      this.extraPrice,
      this.rooms,
      this.startDate,
      this.endDate,
      this.subtitle})
      : super(key: key);

  @override
  State<VerifyDisponibilityScreen> createState() =>
      _VerifyDisponibilityScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<ReservationBloc>(
      create: (context) => ReservationBloc(),
      child: this,
    );
  }
}

class _VerifyDisponibilityScreenState extends State<VerifyDisponibilityScreen> {
  showLoadingDialog() {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  ScaffoldMessengerState? _scaffoldMessenger;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Access the ScaffoldMessenger here.
    _scaffoldMessenger = ScaffoldMessenger.of(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    context.read<ReservationBloc>().add(ReservationEvent.setParams(
        widget.activityDuration,
        widget.id,
        widget.url,
        widget.title,
        widget.address,
        widget.typeHost,
        widget.salePrice,
        widget.perPerson,
        widget.minNuits,
        DateFormat('yyyy-MM-dd').format(widget.startDate ?? DateTime.now()),
        DateFormat('yyyy-MM-dd').format(widget.endDate ?? DateTime.now()),
        widget.extraPrice,
        widget.price));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReservationBloc, ReservationState>(
      listener: (context, state) {
        if (state.status == StateStatus.loading) {
          showLoadingDialog();
        } else if (state.status == StateStatus.error) {
          print("error");
          Navigator.of(context).pop();
          _scaffoldMessenger?.showSnackBar(
            const SnackBar(
              content: Text("Une erreur s'est produite"),
              backgroundColor: Colors.red,
            ),
          );
          context
              .read<ReservationBloc>()
              .add(const ReservationEvent.initStatus());
        } else if (state.status == StateStatus.success) {
          print("success");
          if (state.availableChalet?.isNotEmpty == true) {
            //Navigator.pop(context);
          }
          if (state.available == true) {
            context
                .read<ReservationBloc>()
                .add(ReservationEvent.addToCart(widget.typeReservation));
            Navigator.of(context).pop();
            context
                .read<ReservationBloc>()
                .add(const ReservationEvent.initStatus());
          } else if (state.available == false) {
            Navigator.pop(context);
            _scaffoldMessenger?.showSnackBar(
              SnackBar(
                content: Text(state.errorText ?? ""),
                backgroundColor: Colors.red,
              ),
            );
            //Navigator.pop(context);
            context
                .read<ReservationBloc>()
                .add(const ReservationEvent.initStatus());
          }
        }
      },
      builder: (context, state) {
        print("state.totalPrice");
        print(state.totalPrice);
        return Scaffold(
          bottomNavigationBar: BottomAppBar(
            elevation: 0,
            child: BottomReservationBar(
              onPressed: state.guests == 0
                  ? null
                  : () {
                      state.typeHost == "Par Chalet" &&
                                  state.availableChalet?.isNotEmpty == true ||
                              widget.typeReservation == TypeReservation.event
                          ? context.read<ReservationBloc>().add(
                              ReservationEvent.addToCart(
                                  widget.typeReservation))
                          : context.read<ReservationBloc>().add(
                              ReservationEvent.checkAvailability(
                                  widget.typeReservation.toString(),
                                  int.parse(widget.id),
                                  "",
                                  "",
                                  state.guests.toString(),
                                  "0"));
                    },
              title: state.typeHost == "Par Chalet" &&
                      state.availableChalet?.isEmpty == true
                  ? "Sélectionner votre chalet"
                  : "Réserver",
              perPerson: widget.perPerson == "nuit" ? "nuit" : "personne",
              price: state.totalPrice == "" ||
                      state.totalPrice == null ||
                      state.nbNights == "0"
                  ? double.parse(widget.salePrice ?? "").toInt().toString()
                  : '${state.totalPrice.toString()} DT',
            ),
          ),
          appBar: AppBar(
            backgroundColor: Colors.grey[200],
            elevation: 0,
            leading: Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: materialPrimary.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(50)),
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
            centerTitle: true,
            bottom: const PreferredSize(
                child: Divider(
                  thickness: 1,
                  height: 1,
                ),
                preferredSize: Size.fromHeight(16.0)),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  Visibility(
                    visible: widget.typeReservation == TypeReservation.event,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  widget.title,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: primaryOrange),
                                ),
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.calendar_month),
                                  Text(
                                      DateFormat("dd-MM-yyyy").format(
                                          widget.startDate ?? DateTime.now()),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                            fontWeight: FontWeight.w500,
                                          )),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          thickness: 1,
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: widget.typeReservation == TypeReservation.host ||
                        widget.typeReservation == TypeReservation.activity ||
                        widget.typeReservation == TypeReservation.experience,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 28.h, bottom: 10.h),
                          child: Row(
                            children: [
                              const Icon(Icons.calendar_month),
                              SizedBox(width: 10.w),
                              const Text(
                                'Disponibilité',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          thickness: 1,
                        ),
                        CustomDateInput(
                          onDateRangeChanged: (v) {
                            context.read<ReservationBloc>().add(
                                  ReservationEvent.onSelectDates(
                                    DateFormat('yyyy-MM-dd')
                                        .format(v.value!.startDate!),
                                    DateFormat('yyyy-MM-dd')
                                        .format(v.value!.endDate!),
                                    v.value!.endDate!
                                        .difference(v.value!.startDate!)
                                        .inDays
                                        .toString(),
                                  ),
                                );
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16.h, bottom: 10.h),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.people,
                          color: Colors.black,
                        ),
                        SizedBox(width: 10.w),
                        const Text(
                          'Ajouter vos invités',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  CustomHeader(
                    index: 1,
                    title: 'Adulte',
                    subtitle: widget.subtitle ?? "",
                    onchange: (i) {
                      context.read<ReservationBloc>().add(
                          ReservationEvent.onSelectGuests(
                              i, widget.salePrice.toString()));
                    },
                  ),
                  Visibility(
                    visible: widget.typeReservation == TypeReservation.activity,
                    child: CustomHeader(
                      index: 1,
                      title: 'Enfant',
                      subtitle: '13 ans ou plus',
                      onchange: (i) {
                        context.read<ReservationBloc>().add(
                            ReservationEvent.onSelectGuests(
                                i, widget.salePrice.toString()));
                      },
                    ),
                  ),
                  widget.extraPrice?.isNotEmpty == true
                      ? ExtraPriceSectionDisponibility(
                          extraPrices: widget.extraPrice ?? [])
                      : const SizedBox.shrink(),
                  state.availableChalet?.isNotEmpty == true
                      ? ChaletsSectionDisponibility(
                          rooms: widget.rooms ?? [],
                          price: widget.price,
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
