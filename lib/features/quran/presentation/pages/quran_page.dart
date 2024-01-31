import 'package:flutter/material.dart';
import 'package:jadwal_solat/core/constants/colours.dart';
import 'package:jadwal_solat/core/commons/widgets/header.dart';
import 'package:jadwal_solat/features/quran/presentation/widgets/last_read.dart';
import 'package:jadwal_solat/features/quran/presentation/widgets/quran_list.dart';
import 'package:jadwal_solat/features/quran/presentation/widgets/tabbar_quran.dart';

class QuranPage extends StatelessWidget {
  const QuranPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.backgroundColor,
      appBar: const Header(title: 'Al-Quran'),
      body: ListView(
        children: const [
          LastRead(),
          TabbarQuran(),
          QuranList(),
        ],
      ),
    );
  }
}
