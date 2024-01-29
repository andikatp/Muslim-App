import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/carbon.dart';
import 'package:jadwal_solat/core/constants/app_sizes.dart';
import 'package:jadwal_solat/core/extensions/context_extension.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    const ustads = [
      {
        'image': 'assets/ustad1.png',
        'borderColor': Colors.green,
        'containerColor': Color(0xFFFF4E4C),
        'label': 'Pillar Iman',
        'labelContainer': 'Live',
      },
      {
        'image': 'assets/ustad2.png',
        'borderColor': Colors.green,
        'containerColor': Color(0xFFFF4E4C),
        'label': 'Kultum Islami',
        'labelContainer': 'Live',
      },
      {
        'image': 'assets/ustad3.png',
        'borderColor': Colors.white,
        'containerColor': Colors.blue,
        'label': 'Indahnya mualaf',
        'labelContainer': 'Preview',
      },
      {
        'image': 'assets/ustad4.png',
        'borderColor': Colors.white,
        'containerColor': Colors.amber,
        'label': 'Aqiqah',
        'labelContainer': 'Replay',
      },
    ];

    const selamatDatang = 'Selamat Datang';
    const userName = 'user';

    return Container(
      height: context.media.height * 0.45,
      padding: REdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: Sizes.p64,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      selamatDatang,
                      style: context.textTheme.bodyMedium!
                          .copyWith(color: Colors.white),
                    ),
                    Text(
                      userName,
                      style: context.textTheme.headlineSmall!
                          .copyWith(color: Colors.white),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.edit_notifications_outlined,
                      color: Colors.white,
                    ),
                    Gap.w12,
                    CircleAvatar(
                      radius: 35.r,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 32.r,
                        backgroundImage: const AssetImage('assets/Ellipse.png'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          TextField(
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30).r,
                borderSide: BorderSide.none,
              ),
              fillColor: Colors.white,
              filled: true,
              prefixIcon: Icon(
                Icons.search,
                color: Colors.black.withOpacity(0.5),
              ),
              contentPadding:  REdgeInsets.all(19),
              labelText: 'Cari Kajian Menarik...',
              labelStyle: context.textTheme.bodyMedium,
              suffixIcon: Container(
                margin:  REdgeInsets.only(right: 7),
                height: 48,
                width: 48,
                padding:  REdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30).r,
                  color: const Color(0xFF2FD9E3),
                ),
                child: const Iconify(
                  Carbon.settings_adjust,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: ustads
                .map(
                  (ustad) => AvatarUstadWidget(
                    image: ustad['image']! as String,
                    borderColor: ustad['borderColor']! as Color,
                    label: ustad['label']! as String,
                    containerColor: ustad['containerColor']! as Color,
                    labelContainer: ustad['labelContainer']! as String,
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

class AvatarUstadWidget extends StatelessWidget {
  const AvatarUstadWidget({
    required this.image,
    required this.borderColor,
    required this.label,
    required this.containerColor,
    required this.labelContainer,
    super.key,
  });
  final String image;
  final Color borderColor;
  final String label;
  final Color containerColor;
  final String labelContainer;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            CircleAvatar(
              backgroundColor: borderColor,
              radius: 32.r,
              child: CircleAvatar(
                backgroundImage: AssetImage(image),
                radius: 30.r,
              ),
            ),
            Positioned(
              bottom: -3,
              child: Container(
                padding:  REdgeInsets.symmetric(horizontal: 4, vertical: 1),
                decoration: BoxDecoration(
                  color: containerColor,
                  borderRadius: BorderRadius.circular(20).r,
                ),
                child: Center(
                  child: Text(
                    labelContainer,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 7,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Gap.h4,
        Text(
          label,
          style: context.textTheme.bodySmall!.copyWith(color: Colors.white),
        ),
      ],
    );
  }
}
