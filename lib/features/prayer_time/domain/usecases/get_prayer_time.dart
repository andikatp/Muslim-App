import 'package:jadwal_solat/core/usecase/usecase.dart';
import 'package:jadwal_solat/core/utils/typedef.dart';
import 'package:jadwal_solat/features/prayer_time/domain/entities/prayer_time_entity.dart';
import 'package:jadwal_solat/features/prayer_time/domain/repositories/prayer_time_repo.dart';

class GetPrayerTime
    implements UseCaseWithParams<PrayerTimeEntity, GetPrayerTimeParams> {
  GetPrayerTime({required PrayerTimeRepo repository})
      : _repository = repository;

  final PrayerTimeRepo _repository;

  @override
  ResultFuture<PrayerTimeEntity> call(GetPrayerTimeParams params) {
    return _repository.getPrayerTime(
      params.cityName,
      params.year,
      params.month,
      params.date,
    );
  }
}

class GetPrayerTimeParams {
  GetPrayerTimeParams({
    required this.cityName,
    required this.year,
    required this.month,
    required this.date,
  });

  final String cityName;
  final int year;
  final int month;
  final int date;
}
