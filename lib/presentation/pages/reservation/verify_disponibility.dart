import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:idwey/app_router/app_router.dart';
import 'package:idwey/components/bottom_bar.dart';
import 'package:idwey/components/inputs/date_input.dart';
import 'package:idwey/constants/enums.dart';
import 'package:idwey/presentation/blocs/reservation_bloc/reservation_bloc.dart';
import 'package:idwey/presentation/pages/details_page/components/product_page_header/product_page_header.dart';
import 'package:idwey/theme/app_colors.dart';
import 'package:intl/intl.dart';

@RoutePage()
class VerifyDisponibilityScreen extends StatefulWidget {
  final TypeReservation typeReservation;
  final String? activityDuration;
  final String? currency;
  final String id;
  final String url;
  final String title;
  final String address;
  final String? typeHost;
  final int? currencyValue;
  final String? currencyName;
  final String? startDate;
  final String? salePrice;
  final String? perPerson;
  final int? minNuits;
  final String? price;

  const VerifyDisponibilityScreen(
      {Key? key,
      required this.typeReservation,
      this.activityDuration,
      this.currency,
      required this.id,
      required this.title,
      required this.address,
      this.typeHost,
      this.currencyValue,
      this.currencyName,
      this.startDate,
      this.salePrice,
      this.perPerson,
      this.minNuits,
      this.price,
      required this.url})
      : super(key: key);

  @override
  State<VerifyDisponibilityScreen> createState() =>
      _VerifyDisponibilityScreenState();
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

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReservationBloc, ReservationState>(
      listener: (context, state) {
        if (state.status == StateStatus.loading) {
          showLoadingDialog();
        } else if (state.status == StateStatus.success) {
          print("success");
          context.read<ReservationBloc>().initStatus();
          GetIt.I<AppRouter>().push(ConfirmReservationRoute(
            typeReservation: widget.typeReservation,
            url: widget.url ?? "",
            hostName: widget.title,
            dateDebut: state.checkIn ?? "",
            dateFin: state.checkOut ?? "",
            adultes: "3",
            total: state.totalPrice ?? "",
            nuits: state.nbNights ?? "",
            id: widget.id.toString(),
            address: widget.address,
            rooms: [],
            // selectedRooms: selectedRooms,
            currencyValue: widget.currencyValue,
            currencyName: widget.currencyName,
            currency: widget.currency,
          ));
        } else if (state.status == StateStatus.error) {
          print("error");
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Une erreur s'est produite"),
              backgroundColor: Colors.red,
            ),
          );
          context.read<ReservationBloc>().initStatus();
        }
      },
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: BottomAppBar(
            elevation: 0,
            child: BottomReservationBar(
              onPressed: () {
                context.read<ReservationBloc>().add(
                    ReservationEvent.checkAvailability(
                        int.parse(widget.id),
                        widget.startDate ?? "",
                        widget.startDate ?? "",
                        "3",
                        "3"));
              },
              title: "Réserver",
              perPerson: "nuit",
              price: state.totalPrice ?? "",
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
                  const CustomDateInput(),
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
                  const CustomHeader(
                    title: 'Adulte',
                    subtitle: '13 ans ou plus',
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
