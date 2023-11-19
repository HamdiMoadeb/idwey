import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heroicons/heroicons.dart';
import 'package:idwey/theme/app_colors.dart';

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: materialPrimary.withOpacity(0.1),
          ),
          height: 140.w,
          width: 140.w,
          child: Center(
            child: HeroIcon(
              HeroIcons.exclamationCircle,
              size: 50,
              color: primaryOrange,
            ),
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        Text(
          'Aucun avis trouvé',
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}
