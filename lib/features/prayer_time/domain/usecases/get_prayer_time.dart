import 'package:jadwal_solat/core/usecase/usecase.dart';
import 'package:jadwal_solat/core/utils/typedef.dart';
import 'package:jadwal_solat/features/prayer_time/domain/entities/prayer_time_entity.dart';
import 'package:jadwal_solat/features/prayer_time/domain/repositories/prayer_time_repo.dart';

class GetPrayerTime
    implements UseCaseWithParams<PrayerTimeEntity, GetPrayerTimeParams> {
  GetPrayerTime({required this.repository});
  final PrayerTimeRepo repository;

  @override
  ResultFuture<PrayerTimeEntity> call(GetPrayerTimeParams params) {
    return repository.getPrayerTime(params.cityName, params.year, params.month);
  }
}

class GetPrayerTimeParams {
  GetPrayerTimeParams({
    required this.cityName,
    required this.year,
    required this.month,
  });

  final String cityName;
  final int year;
  final int month;
}
