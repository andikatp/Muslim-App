import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jadwal_solat/bloc/nama_quran_cubit.dart';
import 'package:jadwal_solat/screens/quran_read_screen.dart';

class QuranPageScreen extends StatefulWidget {
  const QuranPageScreen({super.key});

  @override
  State<QuranPageScreen> createState() => _QuranPageScreenState();
}

class _QuranPageScreenState extends State<QuranPageScreen> {
  final List<String> _navigation = ['Surah', 'Juz', 'Doa'];
  int tappedIndex = 0;
  @override
  void initState() {
    super.initState();
    context.read<NamaQuranCubit>().getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F1EF),
      body: ListView(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
            ),
            height: 246,
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(20, 65, 20, 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Al-Quran',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                    const Row(
                      children: [
                        Icon(
                          Icons.notifications_active_outlined,
                          size: 18,
                        ),
                        SizedBox(
                          width: 23,
                        ),
                        CircleAvatar(
                          radius: 28,
                          backgroundImage: AssetImage('assets/Ellipse.png'),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Container(
                  height: 68,
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  decoration: BoxDecoration(
                    color: const Color(0xFF5B49ED),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/book.svg',
                            height: 30,
                            width: 33,
                          ),
                          const SizedBox(
                            width: 13,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Terakhir Dibaca',
                                style: GoogleFonts.poppins(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Al-Haqqah : 1',
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 27,
                        child: Text(
                          'اَلْحَاۤقَّةُۙ',
                          textDirection: TextDirection.rtl,
                          style: GoogleFonts.poppins(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 54,
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                _navigation.length,
                (index) {
                  return GestureDetector(
                    child: Container(
                      width: 110,
                      height: 36,
                      decoration: BoxDecoration(
                        color: tappedIndex == index
                            ? const Color(0xFF2FD9E3)
                            : null,
                        boxShadow: tappedIndex == index
                            ? [
                                BoxShadow(
                                  color:
                                      const Color(0xFF2FD9E3).withOpacity(0.5),
                                  offset: const Offset(0, 2),
                                  blurRadius: 6,
                                ),
                              ]
                            : null,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          _navigation[index],
                          style: GoogleFonts.poppins(
                            color: tappedIndex == index
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
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
          BlocBuilder<NamaQuranCubit, NamaQuranState>(
            builder: (context, state) {
              return ListView.separated(
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 10,
                    ),
                    child: ListTile(
                      onTap: () {
                        Navigator.of(context).push(
                          // ignore: inference_failure_on_instance_creation
                          MaterialPageRoute(
                            builder: (_) => QuranReadScreen(
                              halaman: index + 1,
                            ),
                          ),
                        );
                      },
                      leading: CircleAvatar(
                        radius: 22,
                        backgroundColor: Colors.black.withOpacity(0.75),
                        child: Text(state.dataSurah[index].nomor.toString()),
                      ),
                      title: Text(
                        state.dataSurah[index].namaLatin,
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black.withOpacity(0.75),
                        ),
                      ),
                      subtitle: Text(
                        '${state.dataSurah[index].arti} '
                        '(${state.dataSurah[index].jumlahAyat})',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black.withOpacity(0.75),
                        ),
                      ),
                      trailing: Text(
                        state.dataSurah[index].nama,
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black.withOpacity(0.75),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 45),
                  child: Divider(
                    height: 1,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
                itemCount: state.dataSurah.length,
              );
            },
          ),
        ],
      ),
    );
  }
}
