import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      activeColor: Colours.primaryColor,
      headerProps: const EasyHeaderProps(
        monthPickerType: MonthPickerType.switcher,
      ),
      dayProps: EasyDayProps(
        dayStructure: DayStructure.dayStrDayNum,
        activeDayStyle: DayStyle(
          decoration: BoxDecoration(
            color: Colours.primaryColor.withOpacity(0.12),
            borderRadius: BorderRadius.circular(15).r,
            border: Border.all(color: Colours.primaryColor),
          ),
        ),
      ),
      onDateChange: onDateChange,
    );
  }
}
