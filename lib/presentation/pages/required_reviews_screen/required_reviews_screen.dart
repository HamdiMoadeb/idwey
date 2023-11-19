import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:idwey/components/room_item_card/room_item_card.dart';
import 'package:idwey/data/models/booking_dto.dart';
import 'package:idwey/theme/app_colors.dart';

@RoutePage()
class RequiredReviewsScreen extends StatelessWidget {
  const RequiredReviewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(20),
            child: Divider(
              thickness: 1,
            ),
          )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 16.h),
            child: Text(
              'Les Avis requis',
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
            ),
          ),
          const Divider(
            thickness: 1,
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return RoomItemCard(
                  bookingDto: BookingDto(title: ""),
                  callback: null,
                  confirmed: true,
                );
              },
              itemCount: 4,
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 8.h,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
