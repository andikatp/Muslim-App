part of 'zakat_cubit.dart';

@immutable
sealed class ZakatState extends Equatable {
  const ZakatState();

  @override
  List<Object> get props => [];
}

final class ZakatInitial extends ZakatState {
  const ZakatInitial();
}

final class ZakatEmas extends ZakatState {
  const ZakatEmas({required this.message, required this.total});
  final String message;
  final int total;

  @override
  List<Object> get props => [message, total];
}

final class ZakatProfesi extends ZakatState {
  const ZakatProfesi({required this.message, required this.total});
  final String message;
  final String total;

  @override
  List<Object> get props => [message, total];
}

final class ZakatNiaga extends ZakatState {
  const ZakatNiaga({required this.message, required this.total});
  final String message;
  final String total;

  @override
  List<Object> get props => [message, total];
}

final class ZakatMal extends ZakatState {
  const ZakatMal({required this.message, required this.total});
  final String message;
  final String total;

  @override
  List<Object> get props => [message, total];
}

final class ZakatFitrah extends ZakatState {
  const ZakatFitrah({required this.message, required this.total});
  final String message;
  final String total;

  @override
  List<Object> get props => [message, total];
}

final class ZakatPertanian extends ZakatState {
  const ZakatPertanian({required this.message, required this.total});
  final String message;
  final String total;

  @override
  List<Object> get props => [message, total];
}

final class ZakatError extends ZakatState {
  const ZakatError({ required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}
