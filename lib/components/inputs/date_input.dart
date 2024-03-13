import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heroicons/heroicons.dart';
import 'package:idwey/theme/app_colors.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import 'date_container.dart';

class CustomDateInput extends StatefulWidget {
  final bool? showDatesContainers;
  final DateRangePickerSelectionMode selectionMode;
  final Function(DateRangePickerSelectionChangedArgs) onDateRangeChanged;
  const CustomDateInput(
      {Key? key,
      this.showDatesContainers,
      required this.onDateRangeChanged,
      this.selectionMode = DateRangePickerSelectionMode.range})
      : super(key: key);

  @override
  State<CustomDateInput> createState() => _CustomDateInputState();
}

class _CustomDateInputState extends State<CustomDateInput> {
  bool calendarIsVisible = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          visible: dateRange != '' && !calendarIsVisible,
          child: InkWell(
            onTap: () {
              setState(() {
                calendarIsVisible = !calendarIsVisible;
              });
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 8.w),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(
                  color: Colors.black,
                ),
              ),
              child: Row(
                children: [
                  const HeroIcon(
                    HeroIcons.calendarDays,
                    color: Colors.black,
                  ),
                  const SizedBox(width: 10),
                  RichText(
                    text: TextSpan(
                      text: "Les dates sont :",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 16.sp,
                      ),
                      children: [
                        TextSpan(
                          text: dateRange,
                          style: TextStyle(
                            color: primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Visibility(
            visible: dateRange == '' || calendarIsVisible == true,
            child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                child: dateTimeRangePicker())),
        Visibility(
          visible: widget.showDatesContainers == true && dateRange != '',
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomDateContainer(
                  borderColor:
                      dateRange == '' ? Colors.grey[300]! : Colors.black,
                  icon: const HeroIcon(
                    HeroIcons.arrowRightOnRectangle,
                    color: Colors.black,
                  ),
                  hintText: "Arrivée",
                  text: DateFormat('dd/MM/yyyy')
                      .format(dateTime ?? DateTime.now()),
                ),
                const SizedBox(width: 10),
                CustomDateContainer(
                  borderColor:
                      dateRange == '' ? Colors.grey[300]! : Colors.black,
                  icon: const HeroIcon(
                    HeroIcons.arrowLeftOnRectangle,
                    color: Colors.black,
                  ),
                  hintText: "Départ",
                  text: DateFormat('dd/MM/yyyy')
                      .format(dateTime2 ?? DateTime.now()),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

//  DateTimeRange? picked;
  String nbNuits = "1";
  DateTime? dateTime ;
  DateTime? dateTime2 ;
  String start = DateFormat('dd/MM/yyyy').format(DateTime.now());
  String end = DateFormat('dd/MM/yyyy').format(
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 1),
  );

  String dateRange = '';

  dateTimeRangePicker() {
    return Container(
      height: 400.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: SfDateRangePicker(
        controller: null,
        initialDisplayDate: null,
        initialSelectedDate: null,
        showTodayButton: false,
        selectableDayPredicate: (v) {
          if (v.isBefore(DateTime.now())) {
            return false;
          }
          return true;
        },
        showActionButtons: true,
        showNavigationArrow: true,
        confirmText: 'Valider',
        cancelText: 'Reinitialiser',
        headerHeight: 100,
        onSubmit: (v) {
          setState(() {
            calendarIsVisible = false;
          });
        },
        onSelectionChanged: (v) {
          print("v.value22222222");
          print(v.value);
          //print(v.value.startDate.isAfter(DateTime.now()));
          if (widget.selectionMode == DateRangePickerSelectionMode.single) {
            setState(() {
              dateTime = v.value ?? DateTime.now();
              dateTime2 = v.value ?? DateTime.now();
              dateRange =
                  '${DateFormat('dd').format(dateTime!)} ${getMonthAbbreviation(dateTime!.month)}';
              widget.onDateRangeChanged(v);
            });
            return;
          } else {
            setState(() {
              dateTime = v.value.startDate ;
              dateTime2 = v.value.endDate ;
              nbNuits = dateTime2 != null && dateTime != null ? dateTime2!.difference(dateTime!).inDays.toString():"0";
              print('nbuits $nbNuits');
              widget.onDateRangeChanged(v);
              start = dateTime != null ?DateFormat('dd').format(dateTime!):"";
              end = dateTime2 != null ? DateFormat('dd').format(dateTime2!):"";
              dateRange = dateTime2 != null && dateTime != null  ?
                  '$start ${getMonthAbbreviation(dateTime!.month)}- $end ${getMonthAbbreviation(dateTime2!.month)}':"";
            });
          }
        },
        backgroundColor: Colors.white,
        view: DateRangePickerView.month,
        selectionMode: widget.selectionMode,
        initialSelectedRange: dateTime != null || dateTime2 != null ?PickerDateRange(
            dateTime , dateTime2 ):null,
      ),
    );
  }

  String getMonthAbbreviation(int month) {
    final List<String> monthsAbbreviations = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];

    return monthsAbbreviations[month - 1];
  }
}
