import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../utils/colors.dart';

class CustomCalendar extends StatefulWidget {
  @override
  _CustomCalendarState createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      height: 400,
      child: TableCalendar(
        calendarFormat: _calendarFormat,
        focusedDay: _focusedDay,
        shouldFillViewport: true,
        availableGestures: AvailableGestures.horizontalSwipe,
        eventLoader: (day) {
          if (day.day == DateTime.now().day + 1) {
            return ['Cyclic event'];
          }
          return [];
        },
        selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });
          print(selectedDay);
          print(focusedDay);
        },
        daysOfWeekHeight: 40,
        daysOfWeekStyle: DaysOfWeekStyle(
            weekdayStyle: TextStyle(fontWeight: FontWeight.w700),
            weekendStyle: TextStyle(fontWeight: FontWeight.w700)),
        calendarStyle: CalendarStyle(
          cellMargin: EdgeInsets.all(0),
          outsideDaysVisible: false,
          weekendDecoration: BoxDecoration(
            border: Border.all(
              color: primaryGrey,
              width: 1,
            ),
          ),
          defaultDecoration: BoxDecoration(
            border: Border.all(
              color: primaryGrey,
              width: 1,
            ),
          ),
          selectedTextStyle: TextStyle(color: Colors.black),
          selectedDecoration: BoxDecoration(
            color: primaryOrange.withOpacity(0.1),
            border: Border.all(
              color: primaryGrey,
              width: 0.5,
            ),
          ),
        ),
        headerStyle: HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          titleTextStyle: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: materialPrimary),
        ),
        firstDay: DateTime.now(),
        lastDay: DateTime(2100, 1, 1),
      ),
    );
  }
}
