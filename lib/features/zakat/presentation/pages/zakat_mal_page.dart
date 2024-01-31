import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jadwal_solat/core/constants/app_sizes.dart';
import 'package:jadwal_solat/core/constants/colours.dart';
import 'package:jadwal_solat/core/extensions/context_extension.dart';
import 'package:jadwal_solat/features/zakat/presentation/cubit/zakat_cubit.dart';
import 'package:jadwal_solat/features/zakat/presentation/widgets/dialogs.dart';
import 'package:jadwal_solat/features/zakat/presentation/widgets/text_field_zakat.dart';

class ZakatMalPage extends StatelessWidget {
  const ZakatMalPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    void calculateHandler(BuildContext context) {
      final goldString = controller.text;
      final goldInRupiah =
          goldString != '' ? int.parse(goldString.replaceAll('.', '')) : 0;
      const errorMessage =
          'Masukkan jumlah emas berdasarkan rupiah terlebih dahulu.';

      if (controller.text == '' || goldInRupiah <= 0) {
        showDialog<AlertDialog>(
          context: context,
          builder: (context) =>
              buildGeneralDialog(context, errorMessage, controller.clear),
        );
      }

      context.read<ZakatCubit>().getZakatMal(goldInRupiah);

      showDialog<AlertDialog>(
        builder: (context) => BlocBuilder<ZakatCubit, ZakatState>(
          builder: (context, state) {
            if (state is ZakatError) {
              return buildGeneralDialog(
                context,
                state.message,
                controller.clear,
              );
            } else if (state is ZakatMal) {
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
                title: 'Jumlah harta yang tersimpan selama 1 tahun',
              ),
              Text(
                '* Nisab per tahun (2023) Rp. 81.945.667',
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
