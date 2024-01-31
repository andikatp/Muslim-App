import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/eva.dart';
import 'package:iconify_flutter/icons/healthicons.dart';
import 'package:iconify_flutter/icons/ion.dart';
import 'package:jadwal_solat/core/constants/colours.dart';


class DashboardPage extends StatelessWidget {
  const DashboardPage({required this.navigationShell, Key? key})
      : super(key: key ?? const ValueKey('ScaffoldWithNestedNavigation'));
  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        backgroundColor: const Color(0x00fcfcfb),
        elevation: 0,
        selectedIndex: navigationShell.currentIndex,
        indicatorColor: Colours.backgroundColor,
        height: 0.08.sh,
        onDestinationSelected: _goBranch,
        destinations: [
          NavigationDestination(
            icon: SvgPicture.asset('assets/Vector.svg'),
            label: '',
            selectedIcon: SvgPicture.asset('assets/VectorHome.svg'),
          ),
          NavigationDestination(
            icon: Iconify(
              Eva.compass_outline,
              color: Colors.black.withOpacity(0.5),
            ),
            label: '',
            selectedIcon: const Iconify(
              Eva.compass_fill,
              color: Color(0xFF2FD9E3),
            ),
          ),
          NavigationDestination(
            icon: SvgPicture.asset(
              'assets/book-outline.svg',
              height: 24,
              width: 24,
              color: Colors.black.withOpacity(0.5),
            ),
            label: '',
            selectedIcon: const Iconify(
              Ion.book_outline,
              color: Color(0xFF2FD9E3),
            ),
          ),
          NavigationDestination(
            icon: Iconify(
              Healthicons.money_bag_outline,
              color: Colors.black.withOpacity(0.5),
              size: 28.sp,
            ),
            label: '',
            selectedIcon: Iconify(
              Healthicons.money_bag,
              color: Colours.secondaryBlue,
              size: 28.sp,
            ),
          ),
        ],
      ),
    );
  }
}
