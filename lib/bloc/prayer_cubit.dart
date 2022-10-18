import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jadwal_solat/models/prayer_time_api_model.dart';
import 'package:jadwal_solat/services/prayer_service.dart';

class PrayerCubit extends Cubit<PrayerState> {
  PrayerCubit()
      : super(
          PrayerState(jadwalShalat: Jadwal()),
        );

  void getTime({int tahun = 2022, int bulan = 01, int tanggal = 01}) async {
    var service = await PrayerService()
        .getPrayerTime(tahun: tahun, bulan: bulan, tanggal: tanggal);
    emit(
      PrayerState(jadwalShalat: service.jadwal ?? Jadwal()),
    );
  }
}

class PrayerState {
  final Jadwal jadwalShalat;
  PrayerState({required this.jadwalShalat});
}
