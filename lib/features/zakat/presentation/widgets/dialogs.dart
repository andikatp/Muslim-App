import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jadwal_solat/core/constants/colours.dart';

AlertDialog buildGeneralDialog(
  BuildContext ctx,
  String message,
  VoidCallback clear,
) {
  return AlertDialog(
    surfaceTintColor: Colors.white,
    content: Text(message),
    actionsAlignment: MainAxisAlignment.center,
    actions: [
      ElevatedButton(
        onPressed: () {
          clear();
          Navigator.of(ctx).pop();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colours.primaryColor,
        ),
        child: const Text('Hitung Ulang'),
      ),
    ],
  );
}

final _currencyFormatter =
    NumberFormat.currency(locale: 'ID', symbol: '', decimalDigits: 0);

AlertDialog buildSuccessDialog(
  BuildContext ctx,
  String message,
  int total,
  VoidCallback clear, {
  bool isAgriculture = false,
}) {
  return AlertDialog(
    surfaceTintColor: Colors.white,
    content: Text(message),
    title: Text(
      isAgriculture ? '$total Kg' : 'Rp. ${_currencyFormatter.format(total)}',
    ),
    actionsAlignment: MainAxisAlignment.center,
    actions: [
      ElevatedButton(
        onPressed: () {
          clear();
          Navigator.of(ctx).pop();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colours.primaryColor,
        ),
        child: const Text('Hitung Ulang'),
      ),
    ],
  );
}
