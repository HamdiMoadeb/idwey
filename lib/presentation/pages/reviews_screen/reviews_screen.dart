import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:heroicons/heroicons.dart';
import 'package:idwey/app_router/app_router.dart';
import 'package:idwey/components/buttons/button.dart';
import 'package:idwey/components/cards/card_review.dart';
import 'package:idwey/components/reviews_bars/reviews_progress_bar.dart';
import 'package:idwey/data/models/review_dto.dart';
import 'package:idwey/data/models/review_scale_dto.dart';
import 'package:idwey/theme/app_colors.dart';

@RoutePage()
class ReviewsScreen extends StatelessWidget {
  final List<ReviewDto> reviewsList;
  final String? averageRating;
  final String? reviewsNumber;
  final List<ReviewScale> listScale;
  final String id;
  final String type;
  const ReviewsScreen(
      {Key? key,
      required this.reviewsList,
      this.averageRating,
      this.reviewsNumber,
      required this.listScale,
      required this.id,
      required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 16),
          child: SafeArea(
            child: CustomButton.primary(
                onPressed: () {
                  GetIt.I<AppRouter>().push(AddReviewRoute(
                    id: id,
                    type: type,
                  ));
                },
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      HeroIcon(
                        HeroIcons.chatBubbleLeftEllipsis,
                        size: 24.sp,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text("Ajouter votre avis",
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500)),
                    ],
                  ),
                )),
          ),
        ),
      ),
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: materialPrimary.withOpacity(0.8),
                borderRadius: BorderRadius.circular(50)),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(20),
            child: Divider(
              thickness: 1,
            ),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: 20.h, bottom: 20.h, left: 16.w, right: 16.w),
              child: Row(
                children: [
                  const Icon(Icons.star),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    '$averageRating • $reviewsNumber reviews',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20.h, left: 16.w, right: 16.w),
              child: ReviewProgressBars(
                listScale: listScale,
              ),
            ),
            const Divider(),
            reviewsList.isNotEmpty
                ? ListView.separated(
                    itemBuilder: (context, index) {
                      return CardReview(
                        text: reviewsList[index].content ?? "",
                        reviewer: reviewsList[index].author?.name ?? "",
                        date:
                            '${reviewsList[index].createdAt?.month} months ago',
                      );
                    },
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    separatorBuilder: (context, index) {
                      return Divider(
                        thickness: 1.h,
                      );
                    },
                    itemCount: 3)
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
