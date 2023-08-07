import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idwey/theme/app_colors.dart';

class FilterItem extends StatelessWidget {
  final String icon;
  final String label;
  final bool isSelected;
  final Function(bool) onTap;

  const FilterItem({
    Key? key,
    required this.icon,
    required this.label,
    this.isSelected = false,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(!isSelected),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 2.w,
        ),
        child: Container(
          // margin: const EdgeInsets.all(4),
          width: 120.w,
          height: 75.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            gradient: isSelected
                ? kLinearGradient
                : LinearGradient(colors: [
                    Colors.grey[300]!,
                    Colors.grey[300]!,
                    Colors.grey[300]!,
                  ]),
          ),
          child: Container(
            margin: EdgeInsets.all(isSelected ? 2 : 1),
            width: 120.w,
            height: 85.h,
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.h),
            decoration: BoxDecoration(
              color: Colors.white,
              // Set background color to white for a square container
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                isSelected
                    ? Center(
                        child: ShaderMask(
                          blendMode: BlendMode.srcATop,
                          shaderCallback: (Rect bounds) {
                            return kLinearGradient.createShader(bounds);
                          },
                          child: SvgPicture.asset(
                            icon,
                          ),
                        ),
                      )
                    : SvgPicture.asset(
                        icon,
                        color: Colors.grey[300],
                      ),
                SizedBox(width: 8.w),
                isSelected
                    ? ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return kLinearGradient.createShader(bounds);
                        },
                        child: Text(label,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey[300],
                                    fontSize: 14)),
                      )
                    : Text(label,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[300],
                            fontSize: 14)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
