part of 'router.dart';

final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _navigatorKey,
  debugLogDiagnostics: true,
  initialLocation: '/home',
  routerNeglect: true,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, _, navigationShell) => DashboardPage(
        navigationShell: navigationShell,
      ),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/home',
              name: Routes.home.name,
              builder: (context, _) => const MainPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/jadwal',
              name: Routes.jadwal.name,
              builder: (context, _) => BlocProvider(
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
              builder: (context, _) => BlocProvider(
                create: (context) => sl<QuranBloc>(),
                child: const QuranPage(),
              ),
              routes: [
                GoRoute(
                  path: 'detail',
                  name: Routes.detail.name,
                  builder: (context, _) => BlocProvider(
                    create: (context) => sl<QuranBloc>(),
                    child: const QuranDetailPage(),
                  ),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/zakat',
              name: Routes.zakat.name,
              builder: (_, __) => const ZakatPage(),
              routes: [
                GoRoute(
                  path: 'gold',
                  name: Routes.gold.name,
                  builder: (_, __) => const ZakatGoldPage(),
                ),
                GoRoute(
                  path: 'profession',
                  name: Routes.profession.name,
                  builder: (_, __) => const ZakatProfessionPage(),
                ),
                GoRoute(
                  path: 'trade',
                  name: Routes.trade.name,
                  builder: (_, __) => const ZakatTradePage(),
                ),
                GoRoute(
                  path: 'mal',
                  name: Routes.mal.name,
                  builder: (_, __) => const ZakatMalPage(),
                ),
                GoRoute(
                  path: 'fitrah',
                  name: Routes.fitrah.name,
                  builder: (_, __) => const ZakatFitrahPage(),
                ),
                GoRoute(
                  path: 'agriculture',
                  name: Routes.agriculture.name,
                  builder: (_, __) => const ZakatAgriculturePage(),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);
