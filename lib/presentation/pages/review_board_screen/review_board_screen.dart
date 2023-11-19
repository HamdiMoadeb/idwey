import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:heroicons/heroicons.dart';
import 'package:idwey/app_router/app_router.dart';
import 'package:idwey/components/empty_state_widget/empty_state_widget.dart';
import 'package:idwey/components/filter_item/filter_item.dart';
import 'package:idwey/constants/assets.dart';
import 'package:idwey/data/models/booking_dto.dart';
import 'package:idwey/theme/app_colors.dart';

@RoutePage()
class ReviewsBoardScreen extends StatefulWidget {
  const ReviewsBoardScreen({Key? key}) : super(key: key);

  @override
  State<ReviewsBoardScreen> createState() => _ReviewsBoardScreenState();
}

class _ReviewsBoardScreenState extends State<ReviewsBoardScreen> {
  final PageController controller = PageController();
  int selectedIndex = 0;

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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 16.h),
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
            Expanded(
              child: PageView(
                controller: controller,
                children: <Widget>[
                  ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: _buildRoomItem(
                              bookingDto: BookingDto(
                                  title: "title", address: "Nabeul")),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 16.h,
                        );
                      },
                      itemCount: 3),
                  const EmptyStateWidget(),
                  const EmptyStateWidget(),
                  const EmptyStateWidget(),
                ],
              ),
            ),
            buildRequiredReviewsBar(),
          ],
        ));
  }

  Widget _buildRoomItem({BookingDto? bookingDto, bool confirmed = false}) {
    return InkWell(
      onTap: () {
        GetIt.I<AppRouter>().push(const RequiredReviewsRoute());
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
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo.",
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
                            imageUrl: bookingDto?.pervUrl ?? "")),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${bookingDto?.title ?? ""} | ${bookingDto?.address ?? ""}",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 16.sp),
                        ),
                        Text(
                          "4 months ago",
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
                            itemCount: 4,
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

  buildRequiredReviewsBar() {
    return InkWell(
      onTap: () {
        // GetIt.I<AppRouter>().push(const AddReviewRoute());
      },
      child: Container(
          width: double.infinity,
          height: 40.h,
          decoration: BoxDecoration(
            color: primaryOrange,
          ),
          child: Center(
            child: Text(
              "(3) Avis requis",
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
