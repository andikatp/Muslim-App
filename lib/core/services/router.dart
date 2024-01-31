import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jadwal_solat/core/services/injection_container.dart';
import 'package:jadwal_solat/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:jadwal_solat/features/home/presentation/pages/main_page.dart';
import 'package:jadwal_solat/features/prayer_time/presentation/bloc/prayer_time_bloc.dart';
import 'package:jadwal_solat/features/prayer_time/presentation/pages/prayer_time_page.dart';
import 'package:jadwal_solat/features/quran/presentation/bloc/quran_bloc.dart';
import 'package:jadwal_solat/features/quran/presentation/pages/quran_detail_page.dart';
import 'package:jadwal_solat/features/quran/presentation/pages/quran_page.dart';
import 'package:jadwal_solat/features/zakat/presentation/pages/zakat_agriculture_page.dart';
import 'package:jadwal_solat/features/zakat/presentation/pages/zakat_fitrah_page.dart';
import 'package:jadwal_solat/features/zakat/presentation/pages/zakat_gold_page.dart';
import 'package:jadwal_solat/features/zakat/presentation/pages/zakat_gold_trade.dart';
import 'package:jadwal_solat/features/zakat/presentation/pages/zakat_mal_page.dart';
import 'package:jadwal_solat/features/zakat/presentation/pages/zakat_page.dart';
import 'package:jadwal_solat/features/zakat/presentation/pages/zakat_profession_page.dart';

part 'router.main.dart';

enum Routes {
  dashboard,
  home,
  jadwal,
  quran,
  detail,
  zakat,
  gold,
  profession,
  trade,
  mal,
  fitrah,
  agriculture,
}
