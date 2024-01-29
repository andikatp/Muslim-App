import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:jadwal_solat/features/home/presentation/pages/main_page.dart';

enum Routes {
  home,
  destination,
  map,
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: navigatorKey,
  debugLogDiagnostics: true,
  initialLocation: '/home',
   routerNeglect: true,
  routes: [
    GoRoute(
      path: '/home',
      name: Routes.home.name,
      builder: (context, state) => const MainPage(),
    ),
  ],
);
