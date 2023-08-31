import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idwey/components/filter_item/filter_item.dart';
import 'package:idwey/constants/assets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      flexibleSpace: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
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
            FilterItem(
              label: 'Hébergement',
              icon: Assets.inspiration,
              onTap: (v) {
                setState(() {
                  selectedIndex = 0;
                });
              },
              isSelected: selectedIndex == 0,
            ),
            FilterItem(
              label: 'Evenement',
              icon: Assets.inspiration,
              onTap: (v) {
                setState(() {
                  selectedIndex = 1;
                });
              },
              isSelected: selectedIndex == 1,
            ),
            FilterItem(
              label: 'Acitvités',
              icon: Assets.inspiration,
              onTap: (v) {
                setState(() {
                  selectedIndex = 2;
                });
              },
              isSelected: selectedIndex == 2,
            ),
            FilterItem(
              label: 'Produits',
              icon: Assets.inspiration,
              onTap: (v) {
                setState(() {
                  selectedIndex = 3;
                });
              },
              isSelected: selectedIndex == 3,
            ),
            FilterItem(
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
  const SearchBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 50.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 55.h,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[300]!),
              // Light grey background color
              borderRadius:
                  BorderRadius.circular(50.r), // 50 radius for rounded corners
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
                      width: 240.w,
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
          Container(
            height: 55.h,
            width: 55.h,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[300]!),
              // Light grey background color
              borderRadius:
                  BorderRadius.circular(50.r), // 50 radius for rounded corners
            ),

            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
            ), // Adjust padding as needed
            child: SvgPicture.asset(Assets.filter),
          ),
        ],
      ),
    );
  }
}
