import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:idwey/components/buttons/button.dart';
import 'package:idwey/constants/enums.dart';
import 'package:idwey/theme/app_colors.dart';

class BottomReservationBar extends StatelessWidget {
  final String price;
  final String per_person;
  final String sale_price;
  final StateEvent stateEvent;
  final VoidCallback? onPressed;
  const BottomReservationBar(
      {Key? key,
      required this.price,
      this.stateEvent = StateEvent.isAvailable,
      this.per_person = "",
      this.sale_price = "",
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
      width: MediaQuery.of(context).size.width,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "$price / nuit",
            style: Theme.of(context).textTheme.headline1?.copyWith(
                  fontSize: 16.sp,
                  color: primary,
                  fontWeight: FontWeight.w500,
                ),
          ),
          //commented for deployment
          SizedBox(
            width: 220.w,
            child: CustomButton.primary(
              child: Text("Verifier la disponibilité"),
              onPressed: onPressed ?? () {},
            ),
          )
        ],
      ),
    );
  }
}
