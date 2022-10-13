import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jadwal_solat/models/prayer_time_api_model.dart';
import 'package:jadwal_solat/services/prayer_service.dart';

class PrayerCubit extends Cubit<PrayerState> {
  PrayerCubit()
      : super(
          PrayerState(JadwalShalat: Jadwal()),
        );

  void getTime() async {
    var service = await PrayerService().getPrayerTime();
    emit(
      PrayerState(JadwalShalat: service.jadwal ?? Jadwal()),
    );
  }
}

class PrayerState {
  final Jadwal JadwalShalat;

  PrayerState({required this.JadwalShalat});
}
