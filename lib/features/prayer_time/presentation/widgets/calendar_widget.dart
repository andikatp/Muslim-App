import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:jadwal_solat/core/constants/colours.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({
    required this.focusDate,
    required this.onDateChange,
    super.key,
  });

  final DateTime focusDate;
  final ValueChanged<DateTime> onDateChange;

  @override
  Widget build(BuildContext context) {
    return EasyDateTimeLine(
      initialDate: focusDate,
      activeColor: Colours.secondaryBlue,
      headerProps: const EasyHeaderProps(
        monthPickerType: MonthPickerType.switcher,
      ),
      dayProps: EasyDayProps(
        dayStructure: DayStructure.dayStrDayNum,
        activeDayStyle: DayStyle(
          decoration: BoxDecoration(
            color: Colours.secondaryBlue.withOpacity(0.12),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colours.secondaryBlue),
          ),
        ),
      ),
      onDateChange: onDateChange,
    );
  }
}
