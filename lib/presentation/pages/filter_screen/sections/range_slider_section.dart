import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class RangeSliderSection extends StatefulWidget {
  const RangeSliderSection({Key? key}) : super(key: key);

  @override
  State<RangeSliderSection> createState() => _RangeSliderSectionState();
}

class _RangeSliderSectionState extends State<RangeSliderSection> {
  RangeValues _currentRangeValues = const RangeValues(45, 1300);
  SfRangeValues _values = SfRangeValues(40.0, 80.0);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
            ),
            child: Text(
              "Filtrer par prix",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.w500),
            ),
          ),
          Column(
            children: [
              SfRangeSlider(
                min: 45.0,
                max: 1300,
                values: _values,
                interval: 300,
                showDividers: true,
                showTicks: true,
                showLabels: true,
                enableTooltip: true,
                inactiveColor: Colors.grey.shade300,
                labelPlacement: LabelPlacement.onTicks,
                // minorTicksPerInterval: 1,
                onChanged: (SfRangeValues values) {
                  setState(() {
                    _values = values;
                  });
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 100.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black),
                    ),
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Minimum',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          Text(
                            'DT ${_currentRangeValues.start.round()}',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                    child: Divider(
                      thickness: 2,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    width: 100.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black),
                    ),
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Maximum',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          Text(
                            'DT ${_currentRangeValues.end.round()}',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
