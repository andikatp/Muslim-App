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
  const ZakatEmas({required this.total});
  final String total;

  @override
  List<Object> get props => [total];
}

final class ZakatProfesi extends ZakatState {
  const ZakatProfesi({required this.total});
  final String total;

  @override
  List<Object> get props => [total];
}

final class ZakatNiaga extends ZakatState {
  const ZakatNiaga({required this.total});
  final String total;

  @override
  List<Object> get props => [total];
}

final class ZakatMal extends ZakatState {
  const ZakatMal({required this.total});
  final String total;

  @override
  List<Object> get props => [total];
}

final class ZakatFitrah extends ZakatState {
  const ZakatFitrah({required this.total});
  final String total;

  @override
  List<Object> get props => [total];
}

final class ZakatPertanian extends ZakatState {
  const ZakatPertanian({required this.total});
  final String total;

  @override
  List<Object> get props => [total];
}

final class ZakatError extends ZakatState {
  const ZakatError({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}
