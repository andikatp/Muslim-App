import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jadwal_solat/core/constants/app_sizes.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({required this.title, super.key});
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
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
                size: 28.sp,
              ),
              CircleAvatar(
                radius: 24.r,
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
