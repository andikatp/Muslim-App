import 'package:jadwal_solat/core/utils/typedef.dart';
import 'package:jadwal_solat/features/prayer_time/domain/entities/prayer_time_entity.dart';

class PrayerTimeModel extends PrayerTimeEntity {
  const PrayerTimeModel({
    required super.imsak,
    required super.subuh,
    required super.dzuhur,
    required super.ashar,
    required super.maghrib,
    required super.isya,
  });

  const PrayerTimeModel.empty() : super.empty();

  factory PrayerTimeModel.fromJson(ResultMap json) {
    return PrayerTimeModel(
      imsak: json['imsak'] as String,
      subuh: json['subuh'] as String,
      dzuhur: json['dzuhur'] as String,
      ashar: json['ashar'] as String,
      maghrib: json['maghrib'] as String,
      isya: json['isya'] as String,
    );
  }

  ResultMap toJson() {
    return {
      imsak: imsak,
      subuh: subuh,
      dzuhur: dzuhur,
      ashar: ashar,
      maghrib: maghrib,
      isya: isya,
    };
  }
}
