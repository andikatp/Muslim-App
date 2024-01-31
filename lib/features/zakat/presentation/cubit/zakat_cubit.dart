import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'zakat_state.dart';

class ZakatCubit extends Cubit<ZakatState> {
  ZakatCubit() : super(const ZakatInitial());

  void getZakatEmas(int totalPriceGold) {
    if (totalPriceGold < 81945667) {
      emit(const ZakatError(message: 'Harta Anda belum masuk nishab.'));
    } else {
      final totalZakat = totalPriceGold * 0.025;
      emit(
        ZakatEmas(
          total: totalZakat.toInt(),
          message: 'Jumlah Wajib Zakat yang harus dibayarkan '
              '(2,5% dari Nilai Emas)',
        ),
      );
    }
  }
}
