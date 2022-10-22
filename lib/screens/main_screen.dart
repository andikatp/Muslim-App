import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:jadwal_solat/screens/home_page_screen.dart';
import 'package:jadwal_solat/screens/jadwal_solat_screen.dart';
import 'package:iconify_flutter/icons/eva.dart';
import 'package:iconify_flutter/icons/ion.dart';
import 'package:jadwal_solat/screens/quran_page_screen.dart';
import 'package:jadwal_solat/screens/quran_read_screen.dart';

import '../widget/floating_action_button_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _page = [
    HomePageScreen(),
    JadwalSolatScreen(),
    HomePageScreen(),
    QuranPageScreen(),
    QuranReadScreen(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButtonWidget(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/Vector.svg'),
            label: '',
            activeIcon: SvgPicture.asset('assets/VectorHome.svg'),
          ),
          BottomNavigationBarItem(
            icon: Iconify(
              Eva.compass_outline,
              color: Colors.black.withOpacity(0.5),
            ),
            label: '',
            activeIcon: Iconify(
              Eva.compass_fill,
              color: Color(0xFF2FD9E3),
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).backgroundColor,
            icon: const SizedBox.shrink(),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/book-outline.svg',
              height: 24,
              width: 24,
              color: Colors.black.withOpacity(0.5),
            ),
            label: '',
            activeIcon: Iconify(
              Ion.book_outline,
              color: Color(0xFF2FD9E3),
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/person.svg',
              width: 24,
              height: 24,
              color: Colors.black.withOpacity(0.5),
            ),
            label: '',
            activeIcon: SvgPicture.asset(
              'assets/person.svg',
              width: 24,
              height: 24,
              color: Color(0xFF2FD9E3),
            ),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: _page[_selectedIndex],
    );
  }
}
