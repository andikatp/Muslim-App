import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jadwal_solat/features/prayer_time/presentation/bloc/prayer_time_bloc.dart';
import 'package:jadwal_solat/features/prayer_time/presentation/widgets/app_bar_jadwal_widget.dart';
import 'package:jadwal_solat/features/prayer_time/presentation/widgets/calendar_widget.dart';

class PrayerTimePage extends StatefulWidget {
  const PrayerTimePage({super.key});

  @override
  State<PrayerTimePage> createState() => _PrayerTimePageState();
}

class _PrayerTimePageState extends State<PrayerTimePage> {
  DateTime _focusDate = DateTime.now();

  void changeDate(DateTime selectedDate) {
    setState(() {
      _focusDate = selectedDate;
    });
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
          if (state is PrayerTimeLoading) {
            return const Center(
              child: Text('loading'),
            );
          }
          if (state is PrayerTimeError) {
            return Center(
              child: Text(state.message),
            );
          }
          if (state is PrayerTimeLoaded) {
            return Column(
              children: [
                CalendarWidget(focusDate: _focusDate, onDateChange: changeDate),
              ],
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
