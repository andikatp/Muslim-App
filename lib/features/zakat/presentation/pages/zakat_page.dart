// ignore_for_file: depend_on_referenced_packages
import 'package:colorful_iconify_flutter/icons/flat_color_icons.dart';
import 'package:colorful_iconify_flutter/icons/fxemoji.dart';
import 'package:colorful_iconify_flutter/icons/logos.dart';
import 'package:colorful_iconify_flutter/icons/noto.dart';
import 'package:colorful_iconify_flutter/icons/twemoji.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:jadwal_solat/core/commons/widgets/header.dart';
import 'package:jadwal_solat/core/constants/app_sizes.dart';
import 'package:jadwal_solat/core/constants/colours.dart';
import 'package:jadwal_solat/core/extensions/context_extension.dart';
import 'package:jadwal_solat/core/services/router.dart';

class ZakatPage extends StatelessWidget {
  const ZakatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final zakatList = [
      {
        'label': 'Zakat Emas',
        'icon': Noto.coin,
        'path': Routes.gold.name,
      },
      {
        'label': 'Zakat Profesi',
        'icon': FlatColorIcons.sales_performance,
        'path': Routes.profession.name,
      },
      {
        'label': 'Zakat Niaga',
        'icon': Noto.briefcase,
        'path': Routes.trade.name,
      },
      {
        'label': 'Zakat Mal',
        'icon': Logos.treasuredata_icon,
        'path': Routes.mal.name,
      },
      {
        'label': 'Zakat Fitrah',
        'icon': Fxemoji.cookedrice,
        'path': Routes.fitrah.name,
      },
      {
        'label': 'Zakat Pertanian',
        'icon': Twemoji.sheaf_of_rice,
        'path': Routes.agriculture.name,
      },
    ];
    return Scaffold(
      backgroundColor: const Color(0xFF5a48ed),
      appBar: const Header(title: 'Kalkulator Zakat'),
      body: Stack(
        children: [
          Image.asset(
            'assets/Group.png',
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Center(
            child: GridView.builder(
              itemCount: zakatList.length,
              padding: REdgeInsets.all(20),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.h,
                mainAxisSpacing: 16.h,
                mainAxisExtent: 170.h,
              ),
              itemBuilder: (context, index) => Material(
                elevation: 2,
                borderRadius: BorderRadius.circular(16).r,
                color: Colors.white,
                child: InkWell(
                  onTap: () =>
                      context.push('/zakat/${zakatList[index]['path']}'),
                  splashColor: Colours.primaryColor.withOpacity(0.75),
                  borderRadius: BorderRadius.circular(16).r,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16).r,
                    ),
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      runAlignment: WrapAlignment.center,
                      alignment: WrapAlignment.center,
                      direction: Axis.vertical,
                      spacing: Sizes.p12,
                      children: [
                        Iconify(
                          zakatList[index]['icon']!,
                          size: Sizes.p56,
                        ),
                        Text(
                          zakatList[index]['label']!,
                          textAlign: TextAlign.center,
                          style: context.textTheme.bodyLarge!.copyWith(
                            color: Colours.primaryColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 18.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
