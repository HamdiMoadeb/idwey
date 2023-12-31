import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heroicons/heroicons.dart';
import 'package:idwey/theme/app_colors.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class SuperAdventureSection extends StatefulWidget {
  final String points;
  final String points2;
  const SuperAdventureSection(
      {Key? key, required this.points, required this.points2})
      : super(key: key);

  @override
  State<SuperAdventureSection> createState() => _SuperAdventureSectionState();
}

class _SuperAdventureSectionState extends State<SuperAdventureSection> {
  SfRangeValues _values = const SfRangeValues(400.0, 800.0);

  @override
  void initState() {
    // TODO: implement initState

    _values = SfRangeValues(
        double.parse(widget.points), double.parse(widget.points2));

    super.initState();
  }

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
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                      ),
                      child: Text(
                        "Effectuez des réservations pour gagner des points et des récompenses",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: Colors.grey, fontSize: 14),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SfRangeSliderTheme(
                      data: SfRangeSliderThemeData(
                        activeTrackHeight: 12,
                        inactiveTrackHeight: 12,
                        thumbRadius: 14,
                        activeLabelStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                        inactiveLabelStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                        thumbStrokeWidth: 1,
                        activeTrackColor: primaryOrange,
                        inactiveTrackColor: Colors.grey.shade300,
                        tooltipBackgroundColor: primaryOrange,
                        tooltipTextStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                      child: SfRangeSlider(
                        min: 0.0,
                        max: 3000.0,
                        values: _values,
                        // interval: 1500,
                        //showDividers: true,
                        showTicks: true,
                        showLabels: true,
                        enableTooltip: true,
                        edgeLabelPlacement: EdgeLabelPlacement.inside,
                        tooltipTextFormatterCallback:
                            (dynamic actualValue, String formattedText) {
                          return double.parse(actualValue.toString())
                                  .toInt()
                                  .toString() +
                              " points";
                        },
                        labelFormatterCallback: (dynamic actualValue, label) {
                          return double.parse(actualValue.toString())
                                  .toInt()
                                  .toString() +
                              "points";
                        },
                        endThumbIcon: Container(
                            decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.all(color: primaryOrange, width: 1),
                        )),
                        startThumbIcon: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 1),
                          ),
                          child: const HeroIcon(
                            HeroIcons.flag,
                            style: HeroIconStyle.solid,
                            size: 10,
                            color: Colors.white,
                          ),
                        ),
                        labelPlacement: LabelPlacement.onTicks,
                        minorTicksPerInterval: 1,
                        onChanged: (SfRangeValues values) {
                          // setState(() {
                          //   _values = values;
                          // });
                        },
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
