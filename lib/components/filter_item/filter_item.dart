import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idwey/theme/app_colors.dart';

class FilterItemWidget extends StatelessWidget {
  final String icon;
  final String label;
  final bool isSelected;
  final Function(bool) onTap;

  const FilterItemWidget({
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
          width: 110.w,
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
            padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 12.h),
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
                    ? Expanded(
                        child: ShaderMask(
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
                                      fontSize: 12.sp)),
                        ),
                      )
                    : Expanded(
                        child: Text(label,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey[300],
                                    fontSize: 12.sp)),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FilterItemType extends StatelessWidget {
  final Widget icon;
  final String label;
  final Color? color;
  final double? thickness;

  const FilterItemType({
    Key? key,
    required this.icon,
    required this.label,
    this.color,
    this.thickness,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 4.h, bottom: 4.h, right: 16.w),
      child: Container(
        width: 100.w,
        height: 75.h,
        decoration: BoxDecoration(
          // Set background color to white for a square container
          borderRadius: BorderRadius.circular(6.r),
          border: Border.all(color: color ?? primary, width: thickness ?? 2),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              icon,
              SizedBox(height: 8.w),
              Expanded(
                child: Text(label,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: color ?? primary,
                        fontSize: 12)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
