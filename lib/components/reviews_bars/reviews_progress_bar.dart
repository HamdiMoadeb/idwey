import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewProgressBars extends StatelessWidget {
  final List<double> progressValues = [0.2, 0.4, 0.6, 0.8, 1.0];

  ReviewProgressBars({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const ReviewProgressBar(
          progress: 0.2,
          title: "Excellent",
        ),
        SizedBox(height: 10.0.w),
        const ReviewProgressBar(
          progress: 0.4,
          title: "Very Good",
        ),
        SizedBox(height: 10.0.w),
        const ReviewProgressBar(
          progress: 0.6,
          title: "Average",
        ),
        SizedBox(height: 10.0.w),
        const ReviewProgressBar(
          progress: 0.8,
          title: "Poor",
        ),
        SizedBox(height: 10.0.w),
        const ReviewProgressBar(
          progress: 1.0,
          title: "Terrible",
        ),
      ],
    );
  }
}

class ReviewProgressBar extends StatelessWidget {
  final double progress;
  final String title;

  const ReviewProgressBar(
      {Key? key, required this.progress, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        Expanded(child: SizedBox(width: 10.0.w)),
        SizedBox(
          width: 230.w,
          child: LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.grey[200],
            semanticsLabel: title,
            semanticsValue: progress.toString(),
            borderRadius: BorderRadius.circular(10.0),
            minHeight: 8.0,
          ),
        ),
        SizedBox(width: 20.0.w),
        Text(
          (progress * 10).round().toString(),
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        // Add spacing between progress bars
      ],
    );
  }
}
