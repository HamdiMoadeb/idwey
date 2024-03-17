import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:idwey/app_router/app_router.dart';
import 'package:idwey/components/filter_item/filter_item.dart';
import 'package:idwey/constants/assets.dart';
import 'package:idwey/presentation/blocs/blocs.dart';
import 'package:idwey/presentation/pages/filter_screen/filter_screen.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      flexibleSpace: const Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // const Padding(
          //   padding: EdgeInsets.all(8.0),
          //   child: TextField(
          //     decoration: InputDecoration(
          //       hintText: 'Search',
          //       border: OutlineInputBorder(),
          //     ),
          //   ),
          // ),
          FilterList(),
        ],
      ),
    );
  }
}

class FilterList extends StatefulWidget {
  const FilterList({Key? key}) : super(key: key);

  @override
  State<FilterList> createState() => _FilterListState();
}

class _FilterListState extends State<FilterList> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            FilterItemWidget(
              label: 'Hébergement',
              icon: Assets.inspiration,
              onTap: (v) {
                setState(() {
                  selectedIndex = 0;
                });
              },
              isSelected: selectedIndex == 0,
            ),
            FilterItemWidget(
              label: 'Evenement',
              icon: Assets.inspiration,
              onTap: (v) {
                setState(() {
                  selectedIndex = 1;
                });
              },
              isSelected: selectedIndex == 1,
            ),
            FilterItemWidget(
              label: 'Acitvités',
              icon: Assets.inspiration,
              onTap: (v) {
                setState(() {
                  selectedIndex = 2;
                });
              },
              isSelected: selectedIndex == 2,
            ),
            FilterItemWidget(
              label: 'Produits',
              icon: Assets.inspiration,
              onTap: (v) {
                setState(() {
                  selectedIndex = 3;
                });
              },
              isSelected: selectedIndex == 3,
            ),
            FilterItemWidget(
              label: 'Articles',
              icon: Assets.inspiration,
              onTap: (v) {
                setState(() {
                  selectedIndex = 4;
                });
              },
              isSelected: selectedIndex == 4,
            ),
            // Add more filters here
          ],
        ),
      ),
    );
  }
}

class SearchBox extends StatelessWidget {
  TabController  tabController;
   SearchBox({Key? key,required this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0.w, right: 16.w, top: 60.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              GetIt.I<AppRouter>().push(SearchRoute(
                tabController: tabController,
                  selectedTab:
                      context.read<HomeBloc>().state.selectedTab ?? 0));
            },
            child: Container(
              height: 55.h,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]!),
                // Light grey background color
                borderRadius: BorderRadius.circular(
                    50.r), // 50 radius for rounded corners
              ),
              // Adjust padding as needed
              child: Padding(
                padding: EdgeInsets.only(top: 14.h, left: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      Assets.search,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    SizedBox(
                        width: 230.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Recherchez votre Idwey',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.sp,
                                    color: Colors.black)),
                            Text('Lieu • Date • Invité ',
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 10.h,
                                    color: Colors.grey)),
                          ],
                        )),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              width: 10.w,
            ),
          ),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.9,
                      child: const FilterScreen());
                },
              );
            },
            child: Container(
              height: 55.h,
              width: 55.h,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]!),
                // Light grey background color
                borderRadius: BorderRadius.circular(
                    50.r), // 50 radius for rounded corners
              ),

              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
              ), // Adjust padding as needed
              child: SvgPicture.asset(Assets.filter),
            ),
          ),
        ],
      ),
    );
  }
}
