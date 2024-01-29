part of 'prayer_time_bloc.dart';

@immutable
sealed class PrayerTimeState {
  const PrayerTimeState();
}

final class PrayerTimeInitial extends PrayerTimeState {
  const PrayerTimeInitial();
}

final class PrayerTimeLoading extends PrayerTimeState {
  const PrayerTimeLoading();
}

final class PrayerTimeLoaded extends PrayerTimeState {
  const PrayerTimeLoaded({required this.prayerTime});
  final PrayerTimeEntity prayerTime;
}

final class PrayerTimeError extends PrayerTimeState {
  const PrayerTimeError({required this.message});
  final String message;
}
