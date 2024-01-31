import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jadwal_solat/core/constants/app_constant.dart';
import 'package:meta/meta.dart';

part 'zakat_state.dart';

class ZakatCubit extends Cubit<ZakatState> {
  ZakatCubit() : super(const ZakatInitial());

  void getZakatEmas(int totalPriceGold) {
    if (totalPriceGold < AppConstant.nisabEmasPerBulan) {
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

  void getZakatPenghasilan(int totalSalary) {
    if (totalSalary < AppConstant.nisabGajiPerBulan) {
      emit(const ZakatError(message: 'Harta Anda belum masuk nishab.'));
    } else {
      final totalZakat = totalSalary * 0.025;
      emit(
        ZakatProfesi(
          total: totalZakat.toInt(),
          message: 'Jumlah Wajib Zakat yang harus dibayarkan '
              '(2,5% dari Nilai Penghasilan)',
        ),
      );
    }
  }

  void getZakatPerdagangan(int totalPerdagangan) {
    if (totalPerdagangan < AppConstant.nisabEmasPerBulan) {
      emit(const ZakatError(message: 'Harta Anda belum masuk nishab.'));
    } else {
      final totalZakat = totalPerdagangan * 0.025;
      emit(
        ZakatNiaga(
          total: totalZakat.toInt(),
          message: 'Jumlah Wajib Zakat yang harus dibayarkan '
              '(2,5% dari Nilai Penghasilan)',
        ),
      );
    }
  }

  void getZakatMal(int totalPenghasilan) {
    if (totalPenghasilan < AppConstant.nisabEmasPerBulan) {
      emit(const ZakatError(message: 'Harta Anda belum masuk nishab.'));
    } else {
      final totalZakat = totalPenghasilan * 0.025;
      emit(
        ZakatMal(
          total: totalZakat.toInt(),
          message: 'Jumlah Wajib Zakat yang harus dibayarkan '
              '(2,5% dari Nilai Penghasilan)',
        ),
      );
    }
  }
}
