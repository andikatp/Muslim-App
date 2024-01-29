import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/carbon.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:jadwal_solat/models/navigation_homepage_model.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  int tappedIndex = 0;
  List<NavigationHomePageModel> navigation = [
    NavigationHomePageModel(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/Group.svg',
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            'Untuk Anda',
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ],
      ),
    ),
    NavigationHomePageModel(
      content: Text(
        'Mengikuti',
        style: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
    ),
    NavigationHomePageModel(
      content: Text(
        'Live',
        style: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
    ),
    NavigationHomePageModel(
      content: Text(
        'Doa',
        style: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5B49ED),
      body: Stack(
        children: [
          Image.asset(
            'assets/Group.png',
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 330,
                  padding: const EdgeInsets.only(top: 60),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Selamat Datang',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  'Minarwati',
                                  style: GoogleFonts.poppins(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            const Row(
                              children: [
                                Icon(
                                  Icons.edit_notifications_outlined,
                                  color: Colors.white,
                                  size: 28,
                                ),
                                SizedBox(
                                  width: 22,
                                ),
                                CircleAvatar(
                                  radius: 35,
                                  backgroundColor: Colors.white,
                                  child: CircleAvatar(
                                    radius: 32,
                                    backgroundImage:
                                        AssetImage('assets/Ellipse.png'),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.black.withOpacity(0.5),
                            ),
                            contentPadding: const EdgeInsets.all(19),
                            labelText: 'Cari Kajian Menarik...',
                            labelStyle: GoogleFonts.poppins(fontSize: 16),
                            suffixIcon: Container(
                              margin: const EdgeInsets.only(right: 7),
                              height: 48,
                              width: 48,
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: const Color(0xFF2FD9E3),
                              ),
                              child: const Iconify(
                                Carbon.settings_adjust,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AvatarUstadWidget(
                              image: 'assets/ustad1.png',
                              borderColor: Colors.green,
                              containerColor: Color(0xFFFF4E4C),
                              label: 'Pillar Iman',
                              labelContainer: 'Live',
                            ),
                            AvatarUstadWidget(
                              image: 'assets/ustad2.png',
                              borderColor: Colors.green,
                              containerColor: Color(0xFFFF4E4C),
                              label: 'Kultum Islami',
                              labelContainer: 'Live',
                            ),
                            AvatarUstadWidget(
                              image: 'assets/ustad3.png',
                              borderColor: Colors.white,
                              containerColor: Colors.blue,
                              label: 'Indahnya mualaf',
                              labelContainer: 'Preview',
                            ),
                            AvatarUstadWidget(
                              image: 'assets/ustad4.png',
                              borderColor: Colors.white,
                              containerColor: Colors.amber,
                              label: 'Aqiqah',
                              labelContainer: 'Replay',
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 13,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 42),
                  decoration: const BoxDecoration(
                    color: Color(0xFFF2F1EF),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                  ),
                  height: 391,
                  width: double.infinity,
                  child: Column(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 8,),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(
                              navigation.length,
                              (index) {
                                return GestureDetector(
                                  child: Container(
                                    width: 125,
                                    margin: const EdgeInsets.only(right: 10),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: tappedIndex == index
                                          ? const Color(0xFF2FD9E3)
                                          : Colors.white,
                                    ),
                                    child: Center(
                                        child: navigation[index].content,),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      tappedIndex = index;
                                    });
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                'assets/Rectangle.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Tadarus Bulan Ramadhan',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  'Baru Saja',
                                  style: GoogleFonts.poppins(
                                    fontSize: 9,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.amber,
                                  ),
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
                                      backgroundImage:
                                          AssetImage('assets/ustad2.png'),
                                      radius: 10,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'oleh Ustad Rifky',
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
                      ),
                    ],
                  ),
                ),
              ],
            ),
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
              radius: 32,
              child: CircleAvatar(
                backgroundImage: AssetImage(image),
                radius: 30,
              ),
            ),
            Positioned(
              bottom: -3,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                decoration: BoxDecoration(
                  color: containerColor,
                  borderRadius: BorderRadius.circular(20),
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
        const SizedBox(height: 4),
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 9,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
