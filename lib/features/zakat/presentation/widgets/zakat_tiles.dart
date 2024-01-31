import 'package:flutter/material.dart';
import 'package:jadwal_solat/core/constants/colours.dart';

class ZakatTiles extends StatelessWidget {
  const ZakatTiles({required this.title, super.key});
  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Center(child: Text(title)),
      textColor: Colors.white,
      tileColor: Colours.secondaryBlue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      onTap: () => print('object'),
    );
  }
}
