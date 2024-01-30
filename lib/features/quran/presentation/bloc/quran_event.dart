part of 'quran_bloc.dart';

@immutable
sealed class QuranEvent extends Equatable {
  const QuranEvent();

  @override
  List<Object> get props => [];
}

class GetQuransEvent extends QuranEvent {
  const GetQuransEvent();
}

class GetQuranContentEvent extends QuranEvent {
  const GetQuranContentEvent({required this.id});
  final int id;

  @override
  List<Object> get props => [id];
}
