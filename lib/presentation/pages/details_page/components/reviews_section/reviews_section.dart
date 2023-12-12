import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:idwey/app_router/app_router.dart';
import 'package:idwey/components/buttons/button.dart';
import 'package:idwey/components/reviews_bars/reviews_progress_bar.dart';
import 'package:idwey/data/models/review_dto.dart';
import 'package:idwey/data/models/review_scale_dto.dart';
import 'package:idwey/theme/app_colors.dart';

class ReviewsSection extends StatefulWidget {
  final String id;
  final String type;
  final String? reviewsNumber;
  final String? averageRating;
  final List<ReviewDto> reviews;
  final bool canReview;
  final List<ReviewScale> listScale;

  const ReviewsSection(
      {Key? key,
      this.reviewsNumber,
      this.averageRating,
      required this.reviews,
      required this.listScale,
      required this.canReview,
      required this.id,
      required this.type})
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.star),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    '${widget.averageRating} • ${widget.reviewsNumber} reviews',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Visibility(
                visible: widget.canReview,
                child: InkWell(
                  onTap: () {
                    GetIt.I<AppRouter>().push(AddReviewRoute(
                      id: widget.id,
                      type: widget.type,
                    ));
                  },
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: kLinearGradient,
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      )),
                ),
              ),
            ],
          ),
        ),
        ReviewProgressBars(listScale: widget.listScale),
        Visibility(
          visible: widget.reviews.isNotEmpty,
          child: CustomButton.secondaryBlack(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                child: Text(
                  "Afficher les ${widget.reviewsNumber}  avis",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.black, fontWeight: FontWeight.w500),
                ),
              ),
              onPressed: () {
                GetIt.I<AppRouter>().push(ReviewsRoute(
                  id: widget.id,
                  type: widget.type,
                  reviewsList: widget.reviews,
                  averageRating: widget.averageRating,
                  reviewsNumber: widget.reviewsNumber,
                  listScale: widget.listScale,
                ));
              }),
        )
      ],
    );
  }
}
