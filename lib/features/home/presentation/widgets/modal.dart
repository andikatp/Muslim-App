import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:jadwal_solat/core/constants/app_constant.dart';
import 'package:jadwal_solat/core/constants/app_sizes.dart';
import 'package:jadwal_solat/core/constants/colours.dart';
import 'package:jadwal_solat/core/extensions/context_extension.dart';

class Modal extends StatefulWidget {
  const Modal({super.key});

  @override
  State<Modal> createState() => _ModalState();
}

class _ModalState extends State<Modal> {
  final navList = ['Untuk Anda', 'Mengikuti', 'Live'];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.6.sh,
      padding: REdgeInsets.symmetric(horizontal: 20, vertical: 30),
      decoration: BoxDecoration(
        color: Colours.backgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(20).r,
          topRight: const Radius.circular(20).r,
        ),
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: Sizes.p56,
            padding: REdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30).r,
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                navList.length,
                (index) => GestureDetector(
                  onTap: () {
                    setState(() => selectedIndex = index);
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: Sizes.p92,
                    decoration: BoxDecoration(
                      color: selectedIndex == index
                          ? Colours.secondaryBlue
                          : Colors.white,
                      borderRadius: BorderRadius.circular(25).r,
                    ),
                    child: Center(
                      child: Text(
                        navList[index],
                        style: TextStyle(
                          color: selectedIndex == index
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Gap.h20,
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            switchInCurve: Curves.easeIn,
            switchOutCurve: Curves.easeOut,
            child: _buildSelectedNavContainer(),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectedNavContainer() {
    switch (selectedIndex) {
      case 0:
        return FadeTransition(
          key: UniqueKey(),
          opacity: const AlwaysStoppedAnimation(1),
          child: fakeContainer(),
        );
      case 1:
        return FadeTransition(
          key: UniqueKey(),
          opacity: const AlwaysStoppedAnimation(1),
          child: fakeContainer(),
        );
      case 2:
        return FadeTransition(
          key: UniqueKey(),
          opacity: const AlwaysStoppedAnimation(1),
          child: fakeContainer(),
        );
      default:
        return Container();
    }
  }

  Widget fakeContainer() {
    const title = 'Tadarus Bulan Ramadhan';
    const date = 'Baru Saja';
    const ustadName = 'oleh Ustad Rifky';
    return Container(
      padding: REdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20).r,
        color: Colors.white,
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              AppConstant.ustadImage,
              fit: BoxFit.cover,
            ),
          ),
          Gap.h12,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                date,
                style: context.textTheme.bodySmall!
                    .copyWith(color: Colors.deepOrange),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage(AppConstant.ustadAva),
                    radius: 10,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    ustadName,
                    style: GoogleFonts.poppins(
                      fontSize: 9,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Iconify(
                Bi.bookmark,
                color: Colors.black.withOpacity(0.5),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
