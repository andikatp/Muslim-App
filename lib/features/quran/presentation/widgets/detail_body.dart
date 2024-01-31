import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jadwal_solat/core/constants/colours.dart';
import 'package:jadwal_solat/core/extensions/context_extension.dart';
import 'package:jadwal_solat/features/quran/domain/entities/ayat.dart';

class DetailBody extends StatelessWidget {
  const DetailBody({required this.ayat, super.key});
  final AyatEntity ayat;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: REdgeInsets.symmetric(vertical: 18),
            padding: REdgeInsets.symmetric(horizontal: 18, vertical: 14),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colours.primaryColor.withOpacity(0.12),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                width: 1.5,
                color: Colours.primaryColor,
              ),
            ),
            child: Text(
             ayat.ar,
              textDirection: TextDirection.rtl,
              style: context.textTheme.titleMedium,
            ),
          ),
          Text(
            '${ayat.id}.  '
            '${ayat.tr}',
            textAlign: TextAlign.justify,
            style: context.textTheme.titleMedium,
          ),
          const SizedBox(
            height: 7,
          ),
          Text(
            ayat.idn,
            textAlign: TextAlign.justify,
            style: context.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
