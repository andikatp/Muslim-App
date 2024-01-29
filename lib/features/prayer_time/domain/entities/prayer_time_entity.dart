import 'package:equatable/equatable.dart';

class PrayerTimeEntity extends Equatable {
  const PrayerTimeEntity({
    required this.imsak,
    required this.subuh,
    required this.dzuhur,
    required this.ashar,
    required this.maghrib,
    required this.isya,
  });

  const PrayerTimeEntity.empty()
      : this(
          imsak: '',
          subuh: '',
          dzuhur: '',
          ashar: '',
          maghrib: '',
          isya: '',
        );

  final String imsak;
  final String subuh;
  final String dzuhur;
  final String ashar;
  final String maghrib;
  final String isya;

  @override
  List<Object?> get props => [imsak, subuh, dzuhur, ashar, maghrib, isya];
}
