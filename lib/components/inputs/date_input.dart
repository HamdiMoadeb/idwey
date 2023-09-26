import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:idwey/components/components.dart';
import 'package:idwey/theme/app_colors.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomDateInput extends StatefulWidget {
  const CustomDateInput({Key? key}) : super(key: key);

  @override
  State<CustomDateInput> createState() => _CustomDateInputState();
}

class _CustomDateInputState extends State<CustomDateInput> {
  bool calendarIsVisible = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () => setState(() {
            calendarIsVisible = !calendarIsVisible;
          }),
          child: CustomInput(
            enabled: false,
            foregroundColor: Colors.grey[300]!,
            hintText: dateRange,
            prefix: const Icon(
              Icons.calendar_month,
              color: Colors.black,
            ),
          ),
        ),
        Visibility(
            visible: calendarIsVisible,
            child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                child: dateTimeRangePicker())),
      ],
    );
  }

  String start = DateFormat('dd/MM/yyyy').format(DateTime.now());
  String end = DateFormat('dd/MM/yyyy').format(
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 1),
  );

  String dateRange =
      '${DateFormat('dd/MM/yyyy').format(DateTime.now())} - ${DateFormat('dd/MM/yyyy').format(
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 1),
  )}';

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
        showActionButtons: true,
        showNavigationArrow: true,
        confirmText: 'Confirmer',
        cancelText: 'Cancel',
        headerHeight: 100,
        onSubmit: (v) {
          setState(() {
            calendarIsVisible = false;
          });
        },
        onSelectionChanged: (v) {
          setState(() {
            start = DateFormat('dd').format(v.value.startDate!);
            end = DateFormat('dd').format(v.value.endDate!);
            dateRange = '$start - $end';
          });
        },
        backgroundColor: Colors.white,
        view: DateRangePickerView.month,
        selectionMode: DateRangePickerSelectionMode.range,
        initialSelectedRange: PickerDateRange(
            DateTime.now().subtract(const Duration(days: 4)),
            DateTime.now().add(const Duration(days: 3))),
      ),
    );
  }

  String _getMonthAbbreviation(int month) {
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
