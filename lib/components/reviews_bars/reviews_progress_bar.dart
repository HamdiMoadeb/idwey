import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:idwey/data/models/review_scale_dto.dart';

class ReviewProgressBars extends StatelessWidget {
  final List<ReviewScale> listScale;

  const ReviewProgressBars({Key? key, required this.listScale})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        for (var i = 0; i < listScale.length; i++)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: ReviewProgressBar(
              progress: listScale[i].stars != null && listScale[i].stars != 0
                  ? listScale[i].stars! / 5
                  : 0,
              title: listScale[i].title ?? "",
            ),
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
        SizedBox(width: 10.0.w),
        Expanded(
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
