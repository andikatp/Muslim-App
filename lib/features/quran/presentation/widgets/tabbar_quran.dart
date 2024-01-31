import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jadwal_solat/core/constants/app_sizes.dart';
import 'package:jadwal_solat/core/constants/colours.dart';
import 'package:jadwal_solat/core/extensions/context_extension.dart';

class TabbarQuran extends StatefulWidget {
  const TabbarQuran({super.key});

  @override
  State<TabbarQuran> createState() => _TabbarQuranState();
}

class _TabbarQuranState extends State<TabbarQuran> {
  final tabbarList = <String>['Surah', 'Juz', 'Doa'];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.all(20),
      child: Container(
        height: 0.17.sh - kToolbarHeight,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50).r,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(tabbarList.length, (index) {
            final tabbar = tabbarList[index];
            return GestureDetector(
              onTap: () => setState(() => selectedIndex = index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.decelerate,
                width: Sizes.p108,
                padding: REdgeInsets.symmetric(horizontal: 30, vertical: 10),
                decoration: BoxDecoration(
                  color: selectedIndex == index
                      ? Colours.secondaryBlue
                      : Colors.white,
                  borderRadius: BorderRadius.circular(50).r,
                  boxShadow: selectedIndex == index
                      ? [
                          BoxShadow(
                            color: Colours.secondaryBlue.withOpacity(0.5),
                            offset: const Offset(0, 2),
                            blurRadius: 6,
                          ),
                        ]
                      : null,
                ),
                child: Text(
                  tabbar,
                  textAlign: TextAlign.center,
                  style: context.textTheme.bodyMedium!.copyWith(
                    color: selectedIndex == index ? Colors.white : Colors.black,
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
