import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heroicons/heroicons.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class SuperAdventureSection extends StatefulWidget {
  const SuperAdventureSection({Key? key}) : super(key: key);

  @override
  State<SuperAdventureSection> createState() => _SuperAdventureSectionState();
}

class _SuperAdventureSectionState extends State<SuperAdventureSection> {
  RangeValues _currentRangeValues = const RangeValues(45, 1300);
  SfRangeValues _values = SfRangeValues(40.0, 80.0);
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: Colors.grey.shade300)),
      color: Colors.white,
      elevation: 0,
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
              ),
              child: Text(
                "Super Aventurier ",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: const Divider(
                thickness: 1,
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Text(
                        "Effectuez des réservations pour gagner des points et des récompenses",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: Colors.grey, fontSize: 14),
                      ),
                    ),
                    SfRangeSlider(
                      min: 0.0,
                      max: 3000.0,
                      values: _values,
                      interval: 1000,
                      showDividers: true,
                      showTicks: true,
                      showLabels: true,
                      enableTooltip: true,
                      startThumbIcon: const HeroIcon(
                        HeroIcons.flag,
                        style: HeroIconStyle.solid,
                        size: 10,
                        color: Colors.white,
                      ),
                      labelPlacement: LabelPlacement.onTicks,
                      minorTicksPerInterval: 1,
                      onChanged: (SfRangeValues values) {
                        setState(() {
                          _values = values;
                        });
                      },
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
