import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:iconify_flutter/icons/ri.dart';
import 'package:jadwal_solat/core/constants/app_sizes.dart';
import 'package:jadwal_solat/core/constants/colours.dart';
import 'package:jadwal_solat/core/extensions/context_extension.dart';
import 'package:jadwal_solat/features/prayer_time/presentation/bloc/prayer_time_bloc.dart';

class PrayerTime extends StatelessWidget {
  const PrayerTime({required this.state, super.key});
  final PrayerTimeState state;

  @override
  Widget build(BuildContext context) {
    final prayerList = [
      {
        'label': 'Imsak',
        'icon': Ri.notification_3_line,
      },
      {
        'label': 'Subuh',
        'icon': Ph.sun_horizon_light,
      },
      {
        'label': 'Dzuhur',
        'icon': Ph.sun_light,
      },
      {
        'label': 'Ashar',
        'icon': Ph.cloud_sun_light,
      },
      {
        'label': 'Magrib',
        'icon': Ph.cloud_moon_light,
      },
      {
        'label': 'Isya',
        'icon': Bi.moon_stars,
      },
    ];

    String getPrayerTime(
      String label,
      PrayerTimeLoaded state,
    ) {
      switch (label) {
        case 'Imsak':
          return state.prayerTime.imsak;
        case 'Subuh':
          return state.prayerTime.subuh;
        case 'Dzuhur':
          return state.prayerTime.dzuhur;
        case 'Ashar':
          return state.prayerTime.ashar;
        case 'Magrib':
          return state.prayerTime.maghrib;
        case 'Isya':
          return state.prayerTime.isya;
        default:
          return '';
      }
    }

    String getNextPrayerLabel(PrayerTimeLoaded state) {
      final currentHour = DateTime.now().hour;
      final currentMinute = DateTime.now().minute;
      final prayerTimes = [
        'Imsak',
        'Subuh',
        'Dzuhur',
        'Ashar',
        'Magrib',
        'Isya',
      ];

      for (final prayerLabel in prayerTimes) {
        final prayerTime = getPrayerTime(prayerLabel, state);
        final prayerHour = int.parse(prayerTime.substring(0, 2));
        final prayerMinute = int.parse(prayerTime.substring(3, 5));

        if ((currentHour < prayerHour) ||
            (currentHour == prayerHour && currentMinute < prayerMinute)) {
          return prayerLabel;
        }
      }
      return '';
    }

    dartz.Tuple2<Color, Color> getContainerColors(
      String label,
      PrayerTimeLoaded state,
    ) {
      final currentHour = DateTime.now().hour;
      final currentMinute = DateTime.now().minute;
      final prayerTime = getPrayerTime(label, state);
      final prayerHour = int.parse(prayerTime.substring(0, 2));
      final prayerMinute = int.parse(prayerTime.substring(3, 5));

      if ((currentHour < prayerHour) ||
          (currentHour == prayerHour && currentMinute < prayerMinute)) {
        if (label == getNextPrayerLabel(state)) {
          return const dartz.Tuple2(
            Colours.primaryColor,
            Colors.white,
          );
        }
      }
      return const dartz.Tuple2(
        Colors.white,
        Colors.black,
      );
    }

    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      minChildSize: 0.6,
      builder: (context, scrollController) => Container(
        decoration: BoxDecoration(
          color: Colours.backgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(20).r,
            topRight: const Radius.circular(20).r,
          ),
        ),
        child: ListView.separated(
          controller: scrollController,
          separatorBuilder: (_, __) => Gap.h20,
          padding: REdgeInsets.all(20).copyWith(top: 30),
          itemCount: prayerList.length,
          itemBuilder: (context, index) {
            final prayer = prayerList[index];
            final containerColors = state is PrayerTimeLoaded
                ? getContainerColors(
                    prayer['label']!, state as PrayerTimeLoaded,)
                : const dartz.Tuple2(
                    Colors.white,
                    Colors.black,
                  );
            return Container(
              padding: REdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: containerColors.value1,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12.withOpacity(0.1),
                    offset: const Offset(1, 3),
                    blurStyle: BlurStyle.solid,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Wrap(
                    spacing: Sizes.p12,
                    children: [
                      Iconify(
                        prayer['icon']!,
                        size: Sizes.p28,
                        color: containerColors.value2,
                      ),
                      Text(
                        prayer['label']!,
                        style: context.textTheme.bodyLarge!.copyWith(
                          color: containerColors.value2,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    state is PrayerTimeLoaded
                        ? getPrayerTime(
                            prayer['label']!,
                            state as PrayerTimeLoaded,
                          )
                        : 'loading..',
                    style: TextStyle(color: containerColors.value2),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
