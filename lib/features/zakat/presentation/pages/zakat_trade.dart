import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:jadwal_solat/core/constants/app_sizes.dart';
import 'package:jadwal_solat/core/constants/colours.dart';
import 'package:jadwal_solat/core/extensions/context_extension.dart';
import 'package:jadwal_solat/features/zakat/presentation/cubit/zakat_cubit.dart';
import 'package:jadwal_solat/features/zakat/presentation/widgets/dialogs.dart';
import 'package:jadwal_solat/features/zakat/presentation/widgets/text_field_zakat.dart';
import 'package:jadwal_solat/features/zakat/presentation/widgets/text_field_zakat_readonly.dart';

class ZakatTradePage extends StatelessWidget {
  const ZakatTradePage({super.key});

  @override
  Widget build(BuildContext context) {
    final asetController = TextEditingController();
    final labaController = TextEditingController();
    final totalController = TextEditingController();
    final currencyFormatter =
        NumberFormat.currency(locale: 'ID', symbol: '', decimalDigits: 0);

    void clearController() {
      asetController.clear();
      labaController.clear();
      totalController.clear();
    }

    void calculateHandler(BuildContext context) {
      final totalSalary = totalController.text;
      final totalSalaryInRupiah =
          totalSalary != '' ? int.parse(totalSalary.replaceAll('.', '')) : 0;
      const errorMessage =
          'Masukkan penghasilan Perdagangan dalam rupiah terlebih dahulu.';

      if (totalController.text == '' || totalSalaryInRupiah <= 0) {
        showDialog<AlertDialog>(
          context: context,
          builder: (context) =>
              buildGeneralDialog(context, errorMessage, clearController),
        );
      }

      context.read<ZakatCubit>().getZakatPerdagangan(totalSalaryInRupiah);

      showDialog<AlertDialog>(
        builder: (context) => BlocBuilder<ZakatCubit, ZakatState>(
          builder: (context, state) {
            if (state is ZakatError) {
              return buildGeneralDialog(
                context,
                state.message,
                clearController,
              );
            } else if (state is ZakatNiaga) {
              return buildSuccessDialog(
                context,
                state.message,
                state.total,
                clearController,
              );
            }
            return const SizedBox();
          },
        ),
        context: context,
      );
    }

    void onChange(_) {
      final asetString = asetController.text;
      final labaString = labaController.text;
      final profitInRupiah =
          asetString != '' ? int.parse(asetString.replaceAll('.', '')) : 0;
      final labaInRupiah =
          labaString != '' ? int.parse(labaString.replaceAll('.', '')) : 0;
      final total = profitInRupiah + labaInRupiah;
      totalController.text = currencyFormatter.format(total);
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Kalkulator Zakat Perdagangan'),
      ),
      body: Center(
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 40),
          child: Wrap(
            runSpacing: Sizes.p12,
            alignment: WrapAlignment.end,
            children: [
              TextFieldZakat(
                controller: asetController,
                function: onChange,
                title: 'Aset Lancar',
              ),
              TextFieldZakat(
                controller: labaController,
                function: onChange,
                title: 'Laba',
              ),
              TextFieldZakatReadOnly(
                controller: totalController,
                title: 'Jumlah',
              ),
              Text(
                '* Nisab per tahun (2023) Rp. 81.945.667',
                textAlign: TextAlign.end,
                style: context.textTheme.bodySmall!.copyWith(color: Colors.red),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => calculateHandler(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colours.primaryColor,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Hitung'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
