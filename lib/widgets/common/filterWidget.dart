import 'package:another_xlider/another_xlider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../models/sharedModel.dart';
import '../../utils/colors.dart';
import '../../utils/utils.dart';

class FilterTab extends StatefulWidget {
  String title;
  Function(Terms terms, bool value) filtringListFunction;
  Function() showMoreFunction;
  List<Terms> displayedList;
  bool showAllAct;

  FilterTab(
      {Key? key,
      required this.filtringListFunction,
      required this.showMoreFunction,
      required this.displayedList,
      required this.showAllAct,
      required this.title})
      : super(key: key);

  @override
  State<FilterTab> createState() => _FilterTabState();
}

class _FilterTabState extends State<FilterTab> {
  @override
  Widget build(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
            expandedAlignment: Alignment.topLeft,
            collapsedTextColor: titleBlack,
            textColor: titleBlack,
            childrenPadding: EdgeInsets.zero,
            title: Text(
              widget.title,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            children: [
              Column(children: [
                ...widget.displayedList.map(
                  (item) => CheckboxListTile(
                    title: Text(item.name!),
                    value: item.checked,
                    onChanged: (bool? value) {
                      widget.filtringListFunction(item, value!);
                    },
                  ),
                ),
                TextButton(
                  onPressed: () {
                    widget.showMoreFunction();
                  },
                  child: Text(!widget.showAllAct ? 'Plus' : 'Moins'),
                ),
              ])
            ]));
  }
}

class PriceRangeSlider extends StatefulWidget {
  double max = 0;
  double min = 0;
  double lowerValue = 0;
  double upperValue = 0;

  Function() callBack;
  Function(double upperValue, double lowerValue) priceRangeChange;
  PriceRangeSlider(
      {Key? key,
      required this.max,
      required this.min,
      required this.lowerValue,
      required this.upperValue,
      required this.callBack,
      required this.priceRangeChange})
      : super(key: key);

  @override
  State<PriceRangeSlider> createState() => _PriceRangeSliderState();
}

class _PriceRangeSliderState extends State<PriceRangeSlider> {
  double minDist = 0;
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
            expandedAlignment: Alignment.topLeft,
            collapsedTextColor: titleBlack,
            textColor: titleBlack,
            childrenPadding: EdgeInsets.zero,
            title: Text(
              'Filtrer par prix',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            children: [
              (widget.max != 0 ||
                      widget.min != 0 ||
                      widget.lowerValue != 0 ||
                      widget.upperValue != 0)
                  ? Container(
                      margin: EdgeInsets.only(
                          top: 10, left: 20, right: 20, bottom: 10),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FlutterSlider(
                              values: [widget.lowerValue, widget.upperValue],
                              max: widget.max,
                              min: widget.min,
                              trackBar: FlutterSliderTrackBar(
                                  inactiveTrackBarHeight: 10,
                                  activeTrackBarHeight: 10,
                                  activeTrackBar:
                                      BoxDecoration(color: primaryOrange),
                                  inactiveTrackBar: BoxDecoration(
                                      color: secondaryGrey,
                                      borderRadius: BorderRadius.circular(3))),
                              handler: FlutterSliderHandler(
                                decoration: BoxDecoration(),
                                child: Material(
                                  type: MaterialType.canvas,
                                  color: primaryOrange,
                                  elevation: 0,
                                  child: SizedBox(
                                    width: 2,
                                    height: 16,
                                  ),
                                ),
                              ),
                              rightHandler: FlutterSliderHandler(
                                decoration: BoxDecoration(),
                                child: Material(
                                  type: MaterialType.canvas,
                                  color: primaryOrange,
                                  elevation: 0,
                                  child: SizedBox(
                                    width: 2,
                                    height: 16,
                                  ),
                                ),
                              ),
                              rangeSlider: true,
                              handlerAnimation: FlutterSliderHandlerAnimation(
                                curve: Curves.elasticOut,
                                reverseCurve: null,
                                duration: Duration(milliseconds: 700),
                              ),
                              tooltip: FlutterSliderTooltip(
                                alwaysShowTooltip: true,
                                textStyle:
                                    TextStyle(fontSize: 9, color: Colors.white),
                                boxStyle: FlutterSliderTooltipBox(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(3),
                                        color: primaryOrange)),
                                positionOffset:
                                    FlutterSliderTooltipPositionOffset(top: -8),
                                format: (value) {
                                  if (widget.upperValue - widget.lowerValue <=
                                      minDist) {
                                    return 'DT ${widget.lowerValue} - DT ${widget.upperValue} ';
                                  } else {
                                    return 'DT ${value}';
                                  }
                                },
                              ),
                              hatchMark: FlutterSliderHatchMark(
                                density: 0.2,
                                smallDensity: 2,
                                linesDistanceFromTrackBar: 2,
                                displayLines: true,
                                labelsDistanceFromTrackBar: 55,
                                labels: [
                                  FlutterSliderHatchMarkLabel(
                                      percent: 0,
                                      label: Text(
                                        removeDecimalZeroFormat(
                                            '${widget.min}'),
                                        style:
                                            TextStyle(fontSize: 9, color: grey),
                                      )),
                                  FlutterSliderHatchMarkLabel(
                                      percent: 25,
                                      label: Text(
                                          removeDecimalZeroFormat(
                                              '${widget.min + ((widget.max - widget.min) / 4).round()}'),
                                          style: TextStyle(
                                              fontSize: 9, color: grey))),
                                  FlutterSliderHatchMarkLabel(
                                      percent: 50,
                                      label: Text(
                                          removeDecimalZeroFormat(
                                              '${widget.min + ((widget.max - widget.min) / 2).round()}'),
                                          style: TextStyle(
                                              fontSize: 9, color: grey))),
                                  FlutterSliderHatchMarkLabel(
                                      percent: 75,
                                      label: Text(
                                          removeDecimalZeroFormat(
                                              '${widget.min + ((widget.max - widget.min) * 0.75).round()}'),
                                          style: TextStyle(
                                              fontSize: 9, color: grey))),
                                  FlutterSliderHatchMarkLabel(
                                      percent: 100,
                                      label: Text(
                                          removeDecimalZeroFormat(
                                              '${widget.max}'),
                                          style: TextStyle(
                                              fontSize: 9, color: grey))),
                                ],
                              ),
                              onDragging:
                                  (handlerIndex, lowerValue, upperValue) {
                                setState(() {
                                  minDist = ((widget.max - widget.min) * 0.1) +
                                      widget.min;
                                });
                                print(((widget.max - widget.min) * 0.1) +
                                    widget.min);
                                widget.priceRangeChange(lowerValue, upperValue);
                              },
                            ),
                            TextButton(
                                onPressed: () {
                                  widget.callBack();
                                },
                                child: Text(
                                  'Appliquer',
                                  style: TextStyle(
                                      color: primaryOrange,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14),
                                ))
                          ]))
                  : Container(),
            ]));
  }
}
