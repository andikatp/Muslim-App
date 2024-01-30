import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jadwal_solat/features/prayer_time/data/models/prayer_time_model.dart';
import 'package:jadwal_solat/models/prayer_time_api_model.dart';
import 'package:jadwal_solat/services/prayer_service.dart';

class PrayerCubit extends Cubit<PrayerState> {
  PrayerCubit()
      : super(
          PrayerState(jadwalShalat: const PrayerTimeModel.empty()),
        );

  DateTime? selectedDate = DateTime.now();

  Future<void> getTime({
    int tahun = 2022,
    int bulan = 01,
    int tanggal = 01,
    DateTime? date,
  }) async {
    selectedDate = date;
    final service = await PrayerService()
        .getPrayerTime(tahun: tahun, bulan: bulan, tanggal: tanggal);
    emit(
      PrayerState(jadwalShalat: service),
    );
  }
}

class PrayerState {
  PrayerState({required this.jadwalShalat});
  final PrayerTimeModel jadwalShalat;
}
