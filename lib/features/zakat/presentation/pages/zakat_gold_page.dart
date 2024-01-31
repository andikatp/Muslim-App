import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jadwal_solat/core/constants/app_sizes.dart';
import 'package:jadwal_solat/core/constants/colours.dart';
import 'package:jadwal_solat/features/zakat/presentation/cubit/zakat_cubit.dart';
import 'package:jadwal_solat/features/zakat/presentation/widgets/text_field_zakat.dart';

class ZakatGoldPage extends StatelessWidget {
  const ZakatGoldPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    void calculateHandler() {}

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Kalkulator Zakat Emas'),
      ),
      body: BlocBuilder<ZakatCubit, ZakatState>(
        builder: (context, state) {
          return Center(
            child: Padding(
              padding: REdgeInsets.symmetric(horizontal: 40),
              child: Wrap(
                runSpacing: Sizes.p12,
                children: [
                  TextFieldZakat(
                    controller: controller,
                    title: 'Gaji Perbulan Saya',
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: calculateHandler,
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
          );
        },
      ),
    );
  }
}
