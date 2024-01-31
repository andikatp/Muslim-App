import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jadwal_solat/core/constants/app_constant.dart';
import 'package:meta/meta.dart';

part 'zakat_state.dart';

class ZakatCubit extends Cubit<ZakatState> {
  ZakatCubit() : super(const ZakatInitial());

  void getZakatEmas(int totalPriceGold) {
    if (totalPriceGold < AppConstant.nisab) {
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
    if (totalPerdagangan < AppConstant.nisab) {
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
    if (totalPenghasilan < AppConstant.nisab) {
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

  void getZakatFitrah(int hargaBerasPerKg) {
    final totalZakat = hargaBerasPerKg * 2.5;
    emit(
      ZakatFitrah(
        total: totalZakat.toInt(),
        message: 'Jumlah Wajib Zakat yang harus dibayarkan '
            '(2,5 Kg dari harga beras)',
      ),
    );
  }

  void getZakatPertanian({
    int gabahPerKg = 0,
    bool isWateredWithTools = false,
  }) {
    if (gabahPerKg < 652.8) {
      emit(const ZakatError(message: 'Harta Anda belum masuk nishab.'));
    } else {
      if (isWateredWithTools) {
        var gabahPerKgResult = gabahPerKg.toDouble();
        gabahPerKgResult *= 0.05;
        emit(
          ZakatPertanian(
            total: gabahPerKgResult.toInt(),
            message: 'Jumlah Wajib Zakat yang harus dibayarkan '
                '5% dari Hasil Panen',
          ),
        );
      } else {
        var gabahPerKgResult = gabahPerKg.toDouble();
        gabahPerKgResult *= 0.10;
        emit(
          ZakatPertanian(
            total: gabahPerKgResult.toInt(),
            message: 'Jumlah Wajib Zakat yang harus dibayarkan '
                '10% dari Hasil Panen',
          ),
        );
      }
    }
  }
}
