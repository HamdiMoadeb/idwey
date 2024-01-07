import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:idwey/constants/enums.dart';
import 'package:idwey/helpers/app_bloc/app_bloc.dart';
import 'package:idwey/presentation/blocs/booking_page_bloc/booking_page_bloc.dart';
import 'package:idwey/presentation/pages/auth/components/profile_header.dart';
import 'package:idwey/theme/app_colors.dart';

import 'booking_pages.dart';

@RoutePage()
class BookingBoardScreen extends StatefulWidget {
  const BookingBoardScreen({Key? key}) : super(key: key);

  @override
  State<BookingBoardScreen> createState() => _BookingBoardScreenState();
}

class _BookingBoardScreenState extends State<BookingBoardScreen> {
  @override
  void initState() {
    context.read<AppBloc>().add(const AppEvent.getUser());
    context.read<BookingPageBloc>().add(BookingPageEvent.getBookingList(
        int.parse(context.read<AppBloc>().state.id ?? "0")));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc, AppState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state.status == StateStatus.success) {
          print("state.id");
          print(state.id);
          context.read<BookingPageBloc>().add(BookingPageEvent.getBookingList(
              int.parse(context.read<AppBloc>().state.id ?? "0")));
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
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
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(top: 16.0, left: 16.0, bottom: 16.0),
                child: Text('Mon tableau de bord',
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ),
              const ProfileHeader(
                subtitle: "Liste de souhaits",
                hideSubtitle: true,
              ),
              const Divider(
                thickness: 1,
              ),
              const Expanded(child: BoardPage())
            ],
          ),
        );
      },
    );
  }
}
