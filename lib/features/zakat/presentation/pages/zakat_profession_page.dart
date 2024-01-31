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

class ZakatProfessionPage extends StatelessWidget {
  const ZakatProfessionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final gajiController = TextEditingController();
    final sampinganController = TextEditingController();
    final totalController = TextEditingController();
    final currencyFormatter =
        NumberFormat.currency(locale: 'ID', symbol: '', decimalDigits: 0);

    void clearController() {
      gajiController.clear();
      sampinganController.clear();
      totalController.clear();
    }

    void calculateHandler(BuildContext context) {
      final totalSalary = totalController.text;
      final totalSalaryInRupiah =
          totalSalary != '' ? int.parse(totalSalary.replaceAll('.', '')) : 0;
      const errorMessage = 'Masukkan penghasilan dalam rupiah terlebih dahulu.';

      if (totalController.text == '' || totalSalaryInRupiah <= 0) {
        showDialog<AlertDialog>(
          context: context,
          builder: (context) =>
              buildGeneralDialog(context, errorMessage, clearController),
        );
      }

      context.read<ZakatCubit>().getZakatPenghasilan(totalSalaryInRupiah);

      showDialog<AlertDialog>(
        builder: (context) => BlocBuilder<ZakatCubit, ZakatState>(
          builder: (context, state) {
            if (state is ZakatError) {
              return buildGeneralDialog(
                context,
                state.message,
                clearController,
              );
            } else if (state is ZakatProfesi) {
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
      final gajiString = gajiController.text;
      final sampinganString = sampinganController.text;
      final gajiInRupiah =
          gajiString != '' ? int.parse(gajiString.replaceAll('.', '')) : 0;
      final sampinganInRupiah = sampinganString != ''
          ? int.parse(sampinganString.replaceAll('.', ''))
          : 0;
      final total = gajiInRupiah + sampinganInRupiah;
      totalController.text = currencyFormatter.format(total);
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Kalkulator Zakat Profesi'),
      ),
      body: Center(
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 40),
          child: Wrap(
            runSpacing: Sizes.p12,
            alignment: WrapAlignment.end,
            children: [
              TextFieldZakat(
                controller: gajiController,
                function: onChange,
                title: 'Gaji saya per bulan',
              ),
              TextFieldZakat(
                controller: sampinganController,
                function: onChange,
                title: 'Penghasilan lain-lain per bulan',
              ),
              TextFieldZakatReadOnly(
                controller: totalController,
                title: 'Jumlah penghasilan per bulan',
              ),
              Text(
                '* Nisab per tahun (2023) Rp. 81.945.667'
                '\nNisab per bulan (2023) Rp. 6.828.806',
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
