import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heroicons/heroicons.dart';
import 'package:idwey/theme/app_colors.dart';

class AboutSection extends StatelessWidget {
  final List<String> list;
  final String sectionTitle;
  final String subtitle;
  const AboutSection(
      {Key? key,
      required this.list,
      required this.sectionTitle,
      required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Row(
            children: [
              HeroIcon(
                HeroIcons.document,
                color: primary,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                sectionTitle,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                    color: primary),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SizedBox(
            height: 220.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: 329.w,
                  child: Card(
                    elevation: 0,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),
                      side: BorderSide(
                        color: Colors.grey.withOpacity(0.2),
                        width: 1,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 14.h, horizontal: 14.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const HeroIcon(
                                HeroIcons.chatBubbleLeft,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: Text(
                                  subtitle,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        fontSize: 14.sp,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ],
                          ),
                          const Divider(
                            thickness: 1,
                          ),
                          Text(
                            list[index],
                            maxLines: 6,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: list.length,
            ),
          ),
        ),
      ],
    );
  }
}
