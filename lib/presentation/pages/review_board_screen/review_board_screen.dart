import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:heroicons/heroicons.dart';
import 'package:idwey/app_router/app_router.dart';
import 'package:idwey/components/empty_state_widget/empty_state_widget.dart';
import 'package:idwey/components/filter_item/filter_item.dart';
import 'package:idwey/constants/assets.dart';
import 'package:idwey/constants/enums.dart';
import 'package:idwey/data/models/reviews_board_dto.dart';
import 'package:idwey/presentation/blocs/reviews_board_bloc/reviews_dashboard_bloc.dart';
import 'package:idwey/theme/app_colors.dart';

@RoutePage()
class ReviewsBoardScreen extends StatefulWidget implements AutoRouteWrapper {
  const ReviewsBoardScreen({Key? key}) : super(key: key);

  @override
  State<ReviewsBoardScreen> createState() => _ReviewsBoardScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => ReviewsDashboardBloc(),
      child: this,
    );
  }
}

class _ReviewsBoardScreenState extends State<ReviewsBoardScreen> {
  final PageController controller = PageController();
  int selectedIndex = 0;

  @override
  void initState() {
    context.read<ReviewsDashboardBloc>().add(const GetReviews());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        body: BlocBuilder<ReviewsDashboardBloc, ReviewsDashboardState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 16.h),
                  child: Text(
                    'Gérer mes avis',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                  ),
                ),

                /// build filters horizontal scroll
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 16.w,
                        ),
                        FilterItem(
                          label: 'Hébergement',
                          icon: Assets.hosts,
                          onTap: (v) {
                            /// navigate to screen home
                            context
                                .read<ReviewsDashboardBloc>()
                                .add(const OnChangeType('host'));
                            context
                                .read<ReviewsDashboardBloc>()
                                .add(const GetReviews());
                            setState(() {
                              selectedIndex = 0;
                              controller.animateToPage(0,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.ease);
                            });
                          },
                          isSelected: selectedIndex == 0,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        FilterItem(
                          label: 'Evenement',
                          icon: Assets.events,
                          onTap: (v) {
                            context
                                .read<ReviewsDashboardBloc>()
                                .add(const OnChangeType('event'));
                            context
                                .read<ReviewsDashboardBloc>()
                                .add(const GetReviews());
                            setState(() {
                              selectedIndex = 1;
                              controller.animateToPage(1,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.ease);
                            });
                          },
                          isSelected: selectedIndex == 1,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        FilterItem(
                          label: 'Acitvités',
                          icon: Assets.activities,
                          onTap: (v) {
                            context
                                .read<ReviewsDashboardBloc>()
                                .add(const OnChangeType('activity'));
                            context
                                .read<ReviewsDashboardBloc>()
                                .add(const GetReviews());
                            setState(() {
                              selectedIndex = 2;
                              controller.animateToPage(2,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.ease);
                            });
                          },
                          isSelected: selectedIndex == 2,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        FilterItem(
                          label: 'Experiences',
                          icon: Assets.experiences,
                          onTap: (vv) {
                            context
                                .read<ReviewsDashboardBloc>()
                                .add(const OnChangeType('experience'));
                            context
                                .read<ReviewsDashboardBloc>()
                                .add(const GetReviews());
                            setState(() {
                              selectedIndex = 3;
                              controller.animateToPage(3,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.ease);
                            });
                          },
                          isSelected: selectedIndex == 3,
                        ),
                      ],
                    ),
                  ),
                ),

                const Divider(
                  thickness: 1,
                ),
                state.status == StateStatus.success
                    ? Expanded(
                        child: PageView(
                          controller: controller,
                          children: <Widget>[
                            state.reviewsBoardDto?.reviews?.isNotEmpty == true
                                ? ListView.separated(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                        title: _buildRoomItem(
                                            type: state.type ?? "",
                                            review: state.reviewsBoardDto
                                                ?.reviews?[index]),
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return SizedBox(
                                        height: 16.h,
                                      );
                                    },
                                    itemCount: state
                                            .reviewsBoardDto?.reviews?.length ??
                                        0)
                                : const EmptyStateWidget(),
                            state.reviewsBoardDto?.reviews?.isNotEmpty == true
                                ? ListView.separated(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                        title: _buildRoomItem(
                                            type: state.type ?? "",
                                            review: state.reviewsBoardDto
                                                ?.reviews?[index]),
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return SizedBox(
                                        height: 16.h,
                                      );
                                    },
                                    itemCount: state
                                            .reviewsBoardDto?.reviews?.length ??
                                        0)
                                : const EmptyStateWidget(),
                            state.reviewsBoardDto?.reviews?.isNotEmpty == true
                                ? ListView.separated(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                        title: _buildRoomItem(
                                            type: state.type ?? "",
                                            review: state.reviewsBoardDto
                                                ?.reviews?[index]),
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return SizedBox(
                                        height: 16.h,
                                      );
                                    },
                                    itemCount: state
                                            .reviewsBoardDto?.reviews?.length ??
                                        0)
                                : const EmptyStateWidget(),
                            state.reviewsBoardDto?.reviews?.isNotEmpty == true
                                ? ListView.separated(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                        title: _buildRoomItem(
                                            type: state.type ?? "",
                                            review: state.reviewsBoardDto
                                                ?.reviews?[index]),
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return SizedBox(
                                        height: 16.h,
                                      );
                                    },
                                    itemCount: state
                                            .reviewsBoardDto?.reviews?.length ??
                                        0)
                                : const EmptyStateWidget(),
                          ],
                        ),
                      )
                    : state.status == StateStatus.loading
                        ? const Expanded(
                            child: Center(child: CircularProgressIndicator()))
                        : const SizedBox(),
                buildRequiredReviewsBar(
                    state.reviewsBoardDto?.notreviewed?.totalbookings
                            .toString() ??
                        "0",
                    state.reviewsBoardDto?.notreviewed?.bookingsnotreviewed ??
                        [],
                    state.type ?? ""),
              ],
            );
          },
        ));
  }

  Widget _buildRoomItem(
      {Review? review, bool confirmed = false, required String type}) {
    return InkWell(
      onTap: () {
        GetIt.I<AppRouter>()
            .push(AddReviewRoute(review: review, id: type, type: type));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: primaryOrange, width: 1),
          borderRadius: BorderRadius.circular(10.r),
        ),
        elevation: 0,
        margin: const EdgeInsets.symmetric(vertical: 4),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                review?.content ?? "",
                style: TextStyle(fontSize: 14.sp),
              ),
              SizedBox(
                height: 12.h,
              ),
              const Divider(
                thickness: 1,
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 60.h,
                    height: 60.h,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: CachedNetworkImage(
                            placeholder: (context, url) => SizedBox(
                                height: 40.h,
                                width: 40.h,
                                child: const CircularProgressIndicator()),
                            errorWidget: (context, url, error) => const Icon(
                                  Icons.error,
                                  color: Colors.grey,
                                ),
                            fit: BoxFit.cover,
                            imageUrl: "")),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${review?.serviceTitle ?? ""} | ${review?.address ?? ""}",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 16.sp),
                        ),
                        Text(
                          "${DateTime.now().difference(review!.createdAt!).inDays ~/ 30} months ago",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                              color: Colors.grey),
                        ),
                        SizedBox(
                          height: 30,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return const HeroIcon(
                                HeroIcons.star,
                                color: Colors.amber,
                                style: HeroIconStyle.solid,
                              );
                            },
                            itemCount: review.globalStars ?? 0,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildRequiredReviewsBar(
      String nbReviews, List<Bookingsnotreviewed> list, String type) {
    return InkWell(
      onTap: nbReviews != "0"
          ? () {
              GetIt.I<AppRouter>()
                  .push(RequiredReviewsRoute(type: type, notreviewed: list));
            }
          : null,
      child: Container(
          width: double.infinity,
          height: 40.h,
          decoration: BoxDecoration(
            color: primaryOrange,
          ),
          child: Center(
            child: Text(
              "($nbReviews) Avis requis",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          )),
    );
  }
}
