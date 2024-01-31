import 'package:flutter/material.dart';
import 'package:jadwal_solat/core/constants/colours.dart';
import 'package:jadwal_solat/core/theme/fonts.dart';

class AppTheme {
  const AppTheme._();

  static final currentTheme = ThemeData().copyWith(
    scaffoldBackgroundColor: Colours.backgroundColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: AppFonts.textTheme,
    colorScheme: ColorScheme.fromSeed(seedColor: Colours.primaryColor),
  );
}
