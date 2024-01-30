import 'package:flutter/material.dart';
import 'package:jadwal_solat/core/constants/colours.dart';

class QuranPage extends StatelessWidget {
  const QuranPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.backgroundColor,
      appBar: AppBar(
        title: const Text('Al-Quran'),
        actions: const [
          Icon(
            Icons.notifications_active_outlined,
            size: 18,
          ),
          CircleAvatar(
            radius: 28,
            backgroundImage: AssetImage('assets/Ellipse.png'),
          ),
        ],
      ),
      body: ListView(
        
      ),
    );
  }
}
