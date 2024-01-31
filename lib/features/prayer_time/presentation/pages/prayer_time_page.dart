import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jadwal_solat/features/prayer_time/presentation/bloc/prayer_time_bloc.dart';
import 'package:jadwal_solat/features/prayer_time/presentation/widgets/app_bar_jadwal_widget.dart';
import 'package:jadwal_solat/features/prayer_time/presentation/widgets/calendar_widget.dart';
import 'package:jadwal_solat/features/prayer_time/presentation/widgets/prayer_time.dart';

class PrayerTimePage extends StatefulWidget {
  const PrayerTimePage({super.key});

  @override
  State<PrayerTimePage> createState() => _PrayerTimePageState();
}

class _PrayerTimePageState extends State<PrayerTimePage> {
  DateTime _focusDate = DateTime.now();

  void changeDate(DateTime selectedDate) {
    _focusDate = selectedDate;
    context.read<PrayerTimeBloc>().add(
          GetPrayerTimeEvent(
            year: _focusDate.year,
            month: _focusDate.month,
            date: _focusDate.day,
          ),
        );
  }

  @override
  void didChangeDependencies() {
    final now = DateTime.now();
    context.read<PrayerTimeBloc>().add(
          GetPrayerTimeEvent(
            year: now.year,
            month: now.month,
            date: now.day,
          ),
        );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarJadwalWidget(),
      body: BlocBuilder<PrayerTimeBloc, PrayerTimeState>(
        builder: (context, state) {
          if (state is PrayerTimeError) {
            return Center(
              child: Text(state.message),
            );
          }

          return Stack(
            children: [
              SizedBox(
                height: 1.sh - kToolbarHeight,
                child: CalendarWidget(
                  focusDate: _focusDate,
                  onDateChange: changeDate,
                ),
              ),
              PrayerTime(state: state),
            ],
          );
        },
      ),
    );
  }
}
