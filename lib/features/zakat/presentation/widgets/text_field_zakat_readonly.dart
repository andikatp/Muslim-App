import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jadwal_solat/core/constants/app_sizes.dart';
import 'package:jadwal_solat/core/constants/colours.dart';
import 'package:jadwal_solat/core/extensions/context_extension.dart';

class TextFieldZakatReadOnly extends StatelessWidget {
  const TextFieldZakatReadOnly({
    required this.controller,
    required this.title,
    super.key,
  });
  final String title;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: Sizes.p12,
      children: [
        Text(
          title,
          style: context.textTheme.bodyLarge,
        ),
        TextField(
          readOnly: true,
          controller: controller,
          cursorColor: Colours.primaryColor,
          autofocus: true,
          keyboardType: TextInputType.number,
          inputFormatters: [
            CurrencyTextInputFormatter(
              enableNegative: false,
              locale: 'id',
              symbol: '',
              decimalDigits: 0,
            ),
          ],
          decoration: InputDecoration(
            hintText: '0',
            prefixIcon: const Padding(
              padding: EdgeInsets.all(15),
              child: Text('Rp.'),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20).r,
              borderSide: const BorderSide(
                color: Colours.primaryColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20).r,
              borderSide: const BorderSide(
                color: Colours.primaryColor,
              ),
            ),
            fillColor: Colours.backgroundColor,
            filled: true,
          ),
        ),
      ],
    );
  }
}
