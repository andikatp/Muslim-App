part of 'prayer_time_bloc.dart';

@immutable
sealed class PrayerTimeState extends Equatable {
  const PrayerTimeState();

  @override
  List<Object> get props => [];
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

  @override
  List<Object> get props => [prayerTime];
}

final class PrayerTimeError extends PrayerTimeState {
  const PrayerTimeError({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}
