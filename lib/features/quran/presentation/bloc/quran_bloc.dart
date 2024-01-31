import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jadwal_solat/features/quran/domain/entities/quran_content_entity.dart';
import 'package:jadwal_solat/features/quran/domain/entities/quran_entity.dart';
import 'package:jadwal_solat/features/quran/domain/usecases/get_quran_content.dart';
import 'package:jadwal_solat/features/quran/domain/usecases/get_qurans.dart';
import 'package:meta/meta.dart';

part 'quran_event.dart';
part 'quran_state.dart';

class QuranBloc extends Bloc<QuranEvent, QuranState> {
  QuranBloc({
    required GetQurans getQurans,
    required GetQuranContent getQuranContent,
  })  : _getQurans = getQurans,
        _getQuranContent = getQuranContent,
        super(const QuranInitial()) {
    on<QuranEvent>((event, emit) {
      emit(const QuranLoading());
    });
    on<GetQuransEvent>(_getQuransHandler);
    on<GetQuranContentEvent>(_getQuranContentHandler);
  }
  final GetQurans _getQurans;
  final GetQuranContent _getQuranContent;

  Future<void> _getQuransHandler(
    GetQuransEvent event,
    Emitter<QuranState> emit,
  ) async {
    final result = await _getQurans();
    result.fold(
      (failure) => emit(QuranError(message: failure.errorMessage)),
      (qurans) => emit(QuranLoaded(qurans: qurans)),
    );
  }

  Future<void> _getQuranContentHandler(
    GetQuranContentEvent event,
    Emitter<QuranState> emit,
  ) async {
    final result = await _getQuranContent(event.id);
    result.fold(
      (failure) => emit(QuranError(message: failure.errorMessage)),
      (quran) => emit(QuranContentLoaded(quran: quran)),
    );
  }
}
