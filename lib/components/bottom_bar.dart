import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:idwey/components/buttons/button.dart';
import 'package:idwey/constants/enums.dart';
import 'package:idwey/theme/app_colors.dart';

class BottomReservationBar extends StatelessWidget {
  final String price;
  final String perPerson;
  final String salePrice;
  final StateEvent stateEvent;
  final VoidCallback? onPressed;
  const BottomReservationBar(
      {Key? key,
      required this.price,
      this.stateEvent = StateEvent.isAvailable,
      this.perPerson = "",
      this.salePrice = "",
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
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 5,
            offset: const Offset(0, -3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              "$price / $perPerson",
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontSize: 16.sp,
                    color: primary,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
          //commented for deployment
          SizedBox(
            width: 220.w,
            child: CustomButton.primary(
              child: const Text("Verifier la disponibilité"),
              onPressed: onPressed ?? () {},
            ),
          )
        ],
      ),
    );
  }
}
