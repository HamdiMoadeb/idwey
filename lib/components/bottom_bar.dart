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
  final String? title;
  final int? nbNuit;
  const BottomReservationBar(
      {Key? key,
      required this.price,
      this.stateEvent = StateEvent.isAvailable,
      this.perPerson = "",
      this.salePrice = "",
      this.onPressed,
      this.nbNuit,
      this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("salePrice $salePrice");
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        nbNuit != null && nbNuit! > 1
            ? Container(
                color: Colors.red,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    "Minimum $nbNuit nuitées",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          fontSize: 12.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              )
            : const SizedBox.shrink(),
        Container(
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Visibility(
                      visible: salePrice.isNotEmpty &&
                              salePrice != "0" &&
                              salePrice != 0 &&
                              salePrice != "0.00"
                          ? true
                          : false,
                      child: Text("$price DT",
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: primaryOrange,
                            decoration: TextDecoration.lineThrough,
                          )),
                    ),
                    Text(
                      salePrice.isNotEmpty &&
                              salePrice != "0" &&
                              salePrice != 0 &&
                              salePrice != "0.00"
                          ? "$salePrice DT / $perPerson"
                          : "$price DT / $perPerson",
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                            fontSize: 16.sp,
                            color: primary,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ],
                ),
              ),
              //commented for deployment
              SizedBox(
                width: 220.w,
                child: stateEvent == StateEvent.isExpired
                    ? CustomButton.secondaryGrey(
                        child: const Text('Evènement expiré '),
                        onPressed: () {},
                      )
                    : CustomButton.primary(
                        child: Text(title ?? "Verifier la disponibilité"),
                        onPressed: onPressed ?? () {},
                      ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
