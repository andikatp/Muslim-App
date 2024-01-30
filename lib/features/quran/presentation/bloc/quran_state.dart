part of 'quran_bloc.dart';

@immutable
sealed class QuranState extends Equatable {
  const QuranState();

  @override
  List<Object?> get props => [];
}

final class QuranInitial extends QuranState {
  const QuranInitial();
}

final class QuranLoading extends QuranState {
  const QuranLoading();
}

final class QuranContentLoading extends QuranState {
  const QuranContentLoading();
}

final class QuranLoaded extends QuranState {
  const QuranLoaded({required this.qurans});
  final List<QuranEntity> qurans;

  @override
  List<Object?> get props => [qurans];
}

final class QuranContentLoaded extends QuranState {
  const QuranContentLoaded({required this.quran});
  final QuranContentEntity quran;

  @override
  List<Object?> get props => [quran];
}

final class QuranError extends QuranState {
  const QuranError({required this.message});
  final String message;

  @override
  List<Object?> get props => [message];
}
