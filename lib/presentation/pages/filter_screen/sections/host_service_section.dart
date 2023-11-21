import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idwey/components/filter_item/filter_item.dart';
import 'package:idwey/constants/assets.dart';

class HostServiceSection extends StatefulWidget {
  const HostServiceSection({Key? key}) : super(key: key);

  @override
  State<HostServiceSection> createState() => _HostServiceSectionState();
}

class _HostServiceSectionState extends State<HostServiceSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20.h, bottom: 16.h),
            child: Text(
              'Host service',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.w500),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                FilterItemType(
                  thickness: 1,
                  color: Colors.black,
                  icon: SvgPicture.asset(
                    Assets.breakfastFilter,
                    height: 30.h,
                    width: 30.h,
                  ),
                  label: "Petit-déjeuner",
                ),
                FilterItemType(
                  thickness: 1,
                  color: Colors.black,
                  icon: SvgPicture.asset(
                    Assets.food,
                    height: 30.h,
                    width: 30.h,
                  ),
                  label: "Déjeuner",
                ),
                FilterItemType(
                  thickness: 1,
                  color: Colors.black,
                  icon: SvgPicture.asset(
                    Assets.dinnerFilter,
                    height: 30.h,
                    width: 30.h,
                  ),
                  label: "Dinner",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
