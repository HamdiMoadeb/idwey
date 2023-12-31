import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:idwey/presentation/blocs/home_page/home_bloc.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class RangeSliderSection extends StatefulWidget {
  final int min;
  final int max;
  const RangeSliderSection({Key? key, required this.min, required this.max})
      : super(key: key);

  @override
  State<RangeSliderSection> createState() => _RangeSliderSectionState();
}

class _RangeSliderSectionState extends State<RangeSliderSection> {
  // RangeValues _currentRangeValues = const RangeValues(45, 1300);
  SfRangeValues _values = const SfRangeValues(40.0, 80.0);

  @override
  void initState() {
    // TODO: implement initState
    _values = SfRangeValues(widget.min.toDouble(), widget.max.toDouble());
    super.initState();
  }

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
                min: widget.min.toDouble(),
                max: widget.max.toDouble(),
                values: _values,
                interval: 600,
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
                  List<String> list = [];
                  list.add(_values.start.round().toString());
                  list.add(_values.end.round().toString());
                  context.read<HomeBloc>().add(HomeEvent.setRangePrices(list));
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
                            'DT ${_values.start.round()}',
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
                            'DT ${_values.end.round()}',
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
