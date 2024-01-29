import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jadwal_solat/features/prayer_time/presentation/bloc/prayer_time_bloc.dart';
import 'package:jadwal_solat/features/prayer_time/presentation/widgets/app_bar_jadwal_widget.dart';

class PrayerTimePage extends StatelessWidget {
  const PrayerTimePage({super.key});

  @override
  Widget build(BuildContext context) {
    context
        .read<PrayerTimeBloc>()
        .add(const GetPrayerTimeEvent(year: 2024, month: 01, date: 30));
    return Scaffold(
      appBar: const AppBarJadwalWidget(),
      body: BlocBuilder<PrayerTimeBloc, PrayerTimeState>(
        builder: (context, state) {
          if (state is PrayerTimeLoading) {
            return const Center(
              child: Text('loading'),
            );
          }
          if (state is PrayerTimeLoaded) {
            return Center(
              child: Text(state.prayerTime.ashar),
            );
          }
          if (state is PrayerTimeError) {
            return Center(
              child: Text(state.message),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
