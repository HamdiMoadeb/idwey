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
    return SizedBox(
      width: 329.w,
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
          side: BorderSide(
            color: Colors.grey.withOpacity(0.2),
            width: 1,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 14.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(text),
              const Divider(
                thickness: 1,
              ),
              Text(
                reviewer,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 14.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              Expanded(
                child: Text(
                  date,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
