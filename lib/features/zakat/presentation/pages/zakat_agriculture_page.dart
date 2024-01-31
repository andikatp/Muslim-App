import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jadwal_solat/core/constants/app_sizes.dart';
import 'package:jadwal_solat/core/constants/colours.dart';
import 'package:jadwal_solat/core/extensions/context_extension.dart';
import 'package:jadwal_solat/features/zakat/presentation/cubit/zakat_cubit.dart';
import 'package:jadwal_solat/features/zakat/presentation/widgets/dialogs.dart';
import 'package:jadwal_solat/features/zakat/presentation/widgets/switch_agriculture.dart';
import 'package:jadwal_solat/features/zakat/presentation/widgets/text_field_zakat.dart';

class ZakatAgriculturePage extends StatelessWidget {
  const ZakatAgriculturePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    var isWateredWithTools = false;

    void toggleWateringTools({bool value = false}) =>
        isWateredWithTools = value;

    void calculateHandler(BuildContext context) {
      final grainInKgString = controller.text;
      final grainInKgInRupiah = grainInKgString != ''
          ? int.parse(grainInKgString.replaceAll('.', ''))
          : 0;
      const errorMessage =
          'Masukkan jumlah emas berdasarkan rupiah terlebih dahulu.';

      if (controller.text == '' || grainInKgInRupiah <= 0) {
        showDialog<AlertDialog>(
          context: context,
          builder: (context) =>
              buildGeneralDialog(context, errorMessage, controller.clear),
        );
      }

      context.read<ZakatCubit>().getZakatPertanian(
            gabahPerKg: grainInKgInRupiah,
            isWateredWithTools: isWateredWithTools,
          );

      showDialog<AlertDialog>(
        builder: (context) => BlocBuilder<ZakatCubit, ZakatState>(
          builder: (context, state) {
            if (state is ZakatError) {
              return buildGeneralDialog(
                context,
                state.message,
                controller.clear,
              );
            } else if (state is ZakatPertanian) {
              return buildSuccessDialog(
                context,
                state.message,
                state.total,
                controller.clear,
                isAgriculture: true,
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
        title: const Text('Kalkulator Zakat Pertanian'),
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
                agriculture: true,
                title: 'Jumlah gabah dalam setahun',
              ),
              Text(
                '* Nishab 652.8 Kg gabah atau \n520 Kg makanan pokok',
                textAlign: TextAlign.end,
                style: context.textTheme.bodySmall!.copyWith(color: Colors.red),
              ),
              SwitchAgriculture(
                onToggle: toggleWateringTools,
                isWateredWithTools: isWateredWithTools,
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
