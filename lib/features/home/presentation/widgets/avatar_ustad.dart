import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jadwal_solat/core/constants/app_sizes.dart';
import 'package:jadwal_solat/core/extensions/context_extension.dart';

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
                padding: REdgeInsets.symmetric(horizontal: 4, vertical: 1),
                decoration: BoxDecoration(
                  color: containerColor,
                  borderRadius: BorderRadius.circular(20).r,
                ),
                child: Center(
                  child: Text(
                    labelContainer,
                    style: context.textTheme.bodySmall,
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
