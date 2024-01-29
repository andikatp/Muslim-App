part of 'prayer_time_bloc.dart';

@immutable
sealed class PrayerTimeEvent extends Equatable {
  const PrayerTimeEvent();
}

class GetPrayerTimeEvent extends PrayerTimeEvent {
  const GetPrayerTimeEvent({
    required this.year,
    required this.month,
    required this.date,
  });

  final int year;
  final int month;
  final int date;

  @override
  List<Object?> get props => [year, month, date];
}
