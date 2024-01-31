import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jadwal_solat/core/constants/app_sizes.dart';
import 'package:jadwal_solat/core/constants/colours.dart';
import 'package:jadwal_solat/core/extensions/context_extension.dart';
import 'package:jadwal_solat/features/zakat/presentation/cubit/zakat_cubit.dart';
import 'package:jadwal_solat/features/zakat/presentation/widgets/dialogs.dart';
import 'package:jadwal_solat/features/zakat/presentation/widgets/text_field_zakat.dart';

class ZakatFitrahPage extends StatelessWidget {
  const ZakatFitrahPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    void calculateHandler(BuildContext context) {
      final ricePriceString = controller.text;
      final ricePriceInRupiah = ricePriceString != ''
          ? int.parse(ricePriceString.replaceAll('.', ''))
          : 0;
      const errorMessage =
          'Masukkan harga beras per-kg berdasarkan rupiah terlebih dahulu.';

      if (controller.text == '' || ricePriceInRupiah <= 0) {
        showDialog<AlertDialog>(
          context: context,
          builder: (context) =>
              buildGeneralDialog(context, errorMessage, controller.clear),
        );
      }

      context.read<ZakatCubit>().getZakatFitrah(ricePriceInRupiah);

      showDialog<AlertDialog>(
        builder: (context) => BlocBuilder<ZakatCubit, ZakatState>(
          builder: (context, state) {
            if (state is ZakatFitrah) {
              return buildSuccessDialog(
                context,
                state.message,
                state.total,
                controller.clear,
              );
            }
            return const SizedBox();
          },
        ),
        context: context,
      );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Kalkulator Zakat Mal'),
      ),
      body: Center(
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 40),
          child: Wrap(
            runSpacing: Sizes.p12,
            alignment: WrapAlignment.end,
            children: [
              TextFieldZakat(
                controller: controller,
                title: 'Harga beras saat ini di daerah kamu',
              ),
              Text(
                '* Harga beras per-kg * 2.5',
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
