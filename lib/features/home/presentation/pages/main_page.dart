import 'package:flutter/material.dart';
import 'package:jadwal_solat/core/constants/colours.dart';
import 'package:jadwal_solat/features/home/presentation/widgets/header.dart';
import 'package:jadwal_solat/features/home/presentation/widgets/modal.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.backgroundBlue,
      body: Stack(
        children: [
          Image.asset(
            'assets/Group.png',
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          const SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  Header(),
                  Modal(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
