import 'package:flutter/material.dart';
import 'package:jadwal_solat/core/constants/app_sizes.dart';
import 'package:jadwal_solat/core/constants/colours.dart';
import 'package:jadwal_solat/core/extensions/context_extension.dart';

class SwitchAgriculture extends StatefulWidget {
  const SwitchAgriculture({
    required this.onToggle,
    required this.isWateredWithTools,
    super.key,
  });
  final bool isWateredWithTools;
  final void Function({bool value}) onToggle;

  @override
  State<SwitchAgriculture> createState() => _SwitchAgricultureState();
}

class _SwitchAgricultureState extends State<SwitchAgriculture> {
  late bool isWateredWithTools;

  @override
  void initState() {
    super.initState();
    isWateredWithTools = widget.isWateredWithTools;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Text(
            'Apakah ladang pertanian anda disiram '
            'menggunakan alat atau irigasi?',
            style: context.textTheme.bodyMedium,
          ),
        ),
        Gap.w12,
        Switch(
          value: isWateredWithTools,
          activeColor: Colours.primaryColor,
          onChanged: (newValue) {
            setState(() {
              isWateredWithTools = newValue;
            });
            widget.onToggle(value: newValue);
          },
        ),
      ],
    );
  }
}
