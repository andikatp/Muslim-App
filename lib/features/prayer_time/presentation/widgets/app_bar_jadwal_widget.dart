import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/gis.dart';
import 'package:jadwal_solat/core/constants/app_sizes.dart';
import 'package:jadwal_solat/core/extensions/context_extension.dart';

class AppBarJadwalWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const AppBarJadwalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Lokasi Anda Sekarang';
    const cityName = 'Kota Banda Aceh';
    return AppBar(
      flexibleSpace: SafeArea(
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: context.textTheme.bodyMedium,
                  ),
                  Gap.h12,
                  Row(
                    children: [
                      InkWell(
                        borderRadius: BorderRadius.circular(28).r,
                        onTap: () {},
                        child: const Icon(Icons.my_location),
                      ),
                      Gap.w8,
                      Text(
                        cityName,
                        style: context.textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ],
              ),
              Iconify(
                Gis.compass_rose_n,
                size: 60.sp,
                color: Colors.black.withOpacity(0.75),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(97);
}
