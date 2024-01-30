import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jadwal_solat/core/constants/app_sizes.dart';
import 'package:jadwal_solat/core/constants/colours.dart';
import 'package:jadwal_solat/core/extensions/context_extension.dart';

class LastRead extends StatelessWidget {
  const LastRead({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.3.sh - kToolbarHeight,
      width: double.infinity,
      padding: REdgeInsets.symmetric(horizontal: 20, vertical: 40),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: const Radius.circular(25).r,
          bottomRight: const Radius.circular(25).r,
        ),
      ),
      child: Container(
        padding: REdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Colours.backgroundBlue,
          borderRadius: BorderRadius.circular(35).r,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Wrap(
              spacing: Sizes.p12,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/book.svg',
                  height: 30.h,
                  width: 33.h,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Terakhir Dibaca',
                      style: context.textTheme.bodySmall!
                          .copyWith(color: Colors.white),
                    ),
                    Text(
                      'Al-Haqqah : 1',
                      style: context.textTheme.bodyMedium!
                          .copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 27,
              child: Text(
                'اَلْحَاۤقَّةُۙ',
                textDirection: TextDirection.rtl,
                style: context.textTheme.headlineMedium!
                    .copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
