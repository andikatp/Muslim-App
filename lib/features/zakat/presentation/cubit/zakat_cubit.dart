import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'zakat_state.dart';

class ZakatCubit extends Cubit<ZakatState> {
  ZakatCubit() : super(const ZakatInitial());

  void getZakatEmas(int totalPriceGold) {
    emit(const ZakatEmas(total: '1000000'));
  }

  
}
