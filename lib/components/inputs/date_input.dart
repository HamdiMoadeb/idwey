import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heroicons/heroicons.dart';
import 'package:idwey/presentation/blocs/reservation_bloc/reservation_bloc.dart';
import 'package:idwey/theme/app_colors.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import 'date_container.dart';

class CustomDateInput extends StatefulWidget {
  const CustomDateInput({Key? key}) : super(key: key);

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
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomDateContainer(
                borderColor: dateRange == '' ? Colors.grey[300]! : Colors.black,
                icon: const HeroIcon(
                  HeroIcons.arrowRightOnRectangle,
                  color: Colors.black,
                ),
                hintText: "Arrivée",
                text: DateFormat('dd/MM/yyyy').format(dateTime),
              ),
              const SizedBox(width: 10),
              CustomDateContainer(
                borderColor: dateRange == '' ? Colors.grey[300]! : Colors.black,
                icon: const HeroIcon(
                  HeroIcons.arrowLeftOnRectangle,
                  color: Colors.black,
                ),
                hintText: "Départ",
                text: DateFormat('dd/MM/yyyy').format(dateTime2),
              ),
            ],
          ),
        )
      ],
    );
  }

//  DateTimeRange? picked;
  String nbNuits = "1";
  DateTime dateTime = DateTime.now();
  DateTime dateTime2 = DateTime.now();
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
        selectableDayPredicate: (v) {
          if (v.isBefore(DateTime.now())) {
            return false;
          }
          return true;
        },
        showActionButtons: true,
        showNavigationArrow: true,
        initialDisplayDate: DateTime.now(),
        initialSelectedDate: DateTime.now(),
        confirmText: 'Valider',
        cancelText: 'Reinitialiser',
        headerHeight: 100,
        onSubmit: (v) {
          setState(() {
            calendarIsVisible = false;
          });
        },
        onSelectionChanged: (v) {
          setState(() {
            dateTime = v.value.startDate!;
            dateTime2 = v.value.endDate!;
            nbNuits = v.value!.endDate!
                .difference(v.value!.startDate!)
                .inDays
                .toString();
            print('nbuits $nbNuits');
            context.read<ReservationBloc>().add(
                  ReservationEvent.onSelectDates(
                    DateFormat('yyyy-MM-dd').format(dateTime),
                    DateFormat('yyyy-MM-dd').format(dateTime2),
                    nbNuits,
                  ),
                );
            start = DateFormat('dd').format(dateTime);
            end = DateFormat('dd').format(dateTime2);
            dateRange =
                '$start ${getMonthAbbreviation(dateTime.month)}- $end ${getMonthAbbreviation(dateTime2.month)}';
          });
        },
        backgroundColor: Colors.white,
        view: DateRangePickerView.month,
        selectionMode: DateRangePickerSelectionMode.range,
        initialSelectedRange: PickerDateRange(
            DateTime.now().subtract(const Duration(days: 2)),
            DateTime.now().add(const Duration(days: 3))),
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
