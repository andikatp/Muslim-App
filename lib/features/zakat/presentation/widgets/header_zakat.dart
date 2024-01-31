import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jadwal_solat/core/constants/app_sizes.dart';

class HeaderZakat extends StatelessWidget implements PreferredSizeWidget {
  const HeaderZakat({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Zakat'),
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      actions: [
        Padding(
          padding: REdgeInsets.only(right: 20),
          child: Wrap(
            spacing: Sizes.p12,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Icon(
                Icons.notifications_active_outlined,
                size: 18.sp,
              ),
              CircleAvatar(
                radius: 28.r,
                backgroundImage: const AssetImage('assets/Ellipse.png'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
