import 'package:flutter/material.dart';
import 'package:jadwal_solat/features/prayer_time/presentation/widgets/app_bar_jadwal_widget.dart';

class PrayerTimePage extends StatelessWidget {
  const PrayerTimePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarJadwalWidget(),
      body: Column(),
    );
  }
}
