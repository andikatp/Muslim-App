import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jadwal_solat/core/services/injection_container.dart';
import 'package:jadwal_solat/features/home/presentation/pages/main_page.dart';
import 'package:jadwal_solat/features/prayer_time/presentation/bloc/prayer_time_bloc.dart';
import 'package:jadwal_solat/features/prayer_time/presentation/pages/prayer_time_page.dart';
import 'package:jadwal_solat/features/quran/presentation/bloc/quran_bloc.dart';
import 'package:jadwal_solat/features/quran/presentation/pages/quran_detail_page.dart';
import 'package:jadwal_solat/features/quran/presentation/pages/quran_page.dart';

enum Routes {
  home,
  jadwal,
  quran,
  quranDetail,
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: navigatorKey,
  debugLogDiagnostics: true,
  initialLocation: '/jadwal',
  routerNeglect: true,
  routes: [
    GoRoute(
      path: '/home',
      name: Routes.home.name,
      builder: (context, state) => const MainPage(),
    ),
    GoRoute(
      path: '/jadwal',
      name: Routes.jadwal.name,
      builder: (context, state) => BlocProvider(
        create: (context) => sl<PrayerTimeBloc>(),
        child: const PrayerTimePage(),
      ),
    ),
     GoRoute(
      path: '/quran',
      name: Routes.quran.name,
      builder: (context, state) => BlocProvider(
        create: (context) => sl<QuranBloc>(),
        child: const QuranPage(),
      ),
      routes: [
        GoRoute(
          path: 'quran-detail',
          name: Routes.quranDetail.name,
          builder: (context, state) => const QuranDetailPage(),
        ),
      ],
    ),
  ],
);
