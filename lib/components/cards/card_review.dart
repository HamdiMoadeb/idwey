import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardReview extends StatelessWidget {
  final String text;
  final String reviewer;
  final String date;
  const CardReview(
      {Key? key,
      required this.text,
      required this.reviewer,
      required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 14.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              reviewer,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 14.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            Text(
              date,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            const Divider(
              thickness: 1,
            ),
            Text(
              text,
              maxLines: 6,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
