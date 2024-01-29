import 'package:jadwal_solat/core/utils/typedef.dart';
import 'package:jadwal_solat/features/prayer_time/domain/entities/prayer_time_entity.dart';

abstract class PrayerTimeRepo {
  const PrayerTimeRepo();

  ResultFuture<PrayerTimeEntity> getPrayerTime(
    String cityName,
    int year,
    int month,
    int date,
  );
}
