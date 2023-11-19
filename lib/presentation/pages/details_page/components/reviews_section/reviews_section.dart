import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:idwey/app_router/app_router.dart';
import 'package:idwey/components/buttons/button.dart';
import 'package:idwey/components/cards/card_review.dart';
import 'package:idwey/components/reviews_bars/reviews_progress_bar.dart';

class ReviewsSection extends StatefulWidget {
  final String? reviewsNumber;
  final String? averageRating;
  final List<String> reviews;
  const ReviewsSection(
      {Key? key, this.reviewsNumber, this.averageRating, required this.reviews})
      : super(key: key);

  @override
  State<ReviewsSection> createState() => _ReviewsSectionState();
}

class _ReviewsSectionState extends State<ReviewsSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
          child: Row(
            children: [
              const Icon(Icons.star),
              SizedBox(
                width: 5.w,
              ),
              Text(
                '4.95 • 22 reviews',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),

        ReviewProgressBars(),
        // SizedBox(
        //   height: 230.h,
        //   child: ListView.separated(
        //       itemBuilder: (context, index) {
        //         return const CardReview(
        //           text:
        //               "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut purus eget nunc ut dignissim.,consectetur adipiscing elit. Sed ut purus eget nunc ut dignissim.,consectetur adipiscing elit. Sed ut purus eget nunc ut dignissim. Sed ut purus eget nunc ut dignissim. Sed ut purus eget nunc ut dignissim. Sed ut purus eget nunc ut dignissim. Sed ut purus eget nunc ut dignissim. ",
        //           reviewer: 'Reviewer',
        //           date: '4 months ago',
        //         );
        //       },
        //       shrinkWrap: true,
        //       scrollDirection: Axis.horizontal,
        //       separatorBuilder: (context, index) {
        //         return SizedBox(
        //           width: 8.w,
        //         );
        //       },
        //       itemCount: 3),
        // ),
        //
        // /// secondary button to review all reviews if there is more than 3
        Visibility(
          visible: true,
          child: CustomButton.secondaryBlack(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                child: Text(
                  "Afficher les 22 avis",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.black, fontWeight: FontWeight.w500),
                ),
              ),
              onPressed: () {
                GetIt.I<AppRouter>().push(const ReviewsRoute());
              }),
        )
      ],
    );
  }
}
