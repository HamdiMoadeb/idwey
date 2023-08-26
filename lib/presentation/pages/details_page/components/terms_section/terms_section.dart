import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// terms section
class TermsSection extends StatelessWidget {
  /// terms section
  const TermsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Règles de la maison',
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 10.h,
        ),
        Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.verified_user,
                  size: 14.sp,
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text("Entrée : 14:00"),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.verified_user,
                  size: 14.sp,
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text("Sortie : 14:00"),
              ],
            )
          ],
        )
      ],
    );
  }
}
