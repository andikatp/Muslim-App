import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jadwal_solat/features/prayer_time/domain/entities/prayer_time_entity.dart';
import 'package:jadwal_solat/features/prayer_time/domain/usecases/get_prayer_time.dart';
import 'package:meta/meta.dart';

part 'prayer_time_event.dart';
part 'prayer_time_state.dart';

class PrayerTimeBloc extends Bloc<PrayerTimeEvent, PrayerTimeState> {
  PrayerTimeBloc({required GetPrayerTime getPrayerTime})
      : _getPrayerTime = getPrayerTime,
        super(const PrayerTimeInitial()) {
    on<PrayerTimeEvent>((event, emit) {
      emit(const PrayerTimeLoading());
    });
    on<GetPrayerTimeEvent>(_getPrayerTimeHandler);
  }
  final GetPrayerTime _getPrayerTime;

  Future<void> _getPrayerTimeHandler(
    GetPrayerTimeEvent event,
    Emitter<PrayerTimeState> emit,
  ) async {
    final result = await _getPrayerTime(
      GetPrayerTimeParams(
        year: event.year,
        month: event.month,
        date: event.date,
      ),
    );
    result.fold(
      (failure) => emit(PrayerTimeError(message: failure.errorMessage)),
      (prayerTime) => emit(PrayerTimeLoaded(prayerTime: prayerTime)),
    );
  }
}
