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

enum Routes {
  dashboard,
  home,
  jadwal,
  quran,
  detail,
}

final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _navigatorKey,
  debugLogDiagnostics: true,
  initialLocation: '/home',
  routerNeglect: true,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) => DashboardPage(
        navigationShell: navigationShell,
      ),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/home',
              name: Routes.home.name,
              builder: (context, state) => const MainPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/jadwal',
              name: Routes.jadwal.name,
              builder: (context, state) => BlocProvider(
                create: (context) => sl<PrayerTimeBloc>(),
                child: const PrayerTimePage(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/quran',
              name: Routes.quran.name,
              builder: (context, state) => BlocProvider(
                create: (context) => sl<QuranBloc>(),
                child: const QuranPage(),
              ),
              routes: [
                GoRoute(
                  path: 'detail',
                  name: Routes.detail.name,
                  builder: (context, state) => BlocProvider(
                    create: (context) => sl<QuranBloc>(),
                    child: const QuranDetailPage(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);
