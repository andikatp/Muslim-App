import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jadwal_solat/features/quran/domain/entities/quran_content_entity.dart';
import 'package:jadwal_solat/features/quran/domain/entities/quran_entity.dart';
import 'package:meta/meta.dart';

part 'quran_event.dart';
part 'quran_state.dart';

class QuranBloc extends Bloc<QuranEvent, QuranState> {
  QuranBloc() : super(const QuranInitial()) {
    on<QuranEvent>((event, emit) {
      emit(const QuranContentLoading());
    });
  }
}
