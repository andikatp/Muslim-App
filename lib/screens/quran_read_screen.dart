import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:jadwal_solat/bloc/isi_quran_cubit.dart';
import 'package:iconify_flutter/icons/mdi.dart';

class QuranReadScreen extends StatefulWidget {
  const QuranReadScreen({super.key});

  @override
  State<QuranReadScreen> createState() => _QuranReadScreenState();
}

class _QuranReadScreenState extends State<QuranReadScreen> {
  @override
  void initState() {
    super.initState();
    context.read<IsiQuranCubit>().getIsi();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IsiQuranCubit, IsiQuranState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Color(0xFFF5F5F5),
          appBar: AppBar(
            backgroundColor: Color(0xFFF5F5F5),
            leading: IconButton(
              onPressed: () {},
              splashRadius: 15,
              icon: Icon(Icons.arrow_back),
              iconSize: 28,
              color: Colors.black.withOpacity(0.75),
            ),
            centerTitle: true,
            title: Text(
              state.bacaQuran.namaLatin ?? 'Tidak Ada',
              style: GoogleFonts.poppins(
                  fontSize: 18, fontWeight: FontWeight.w400),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Iconify(
                  Mdi.book_open_page_variant_outline,
                  color: Colors.black.withOpacity(0.75),
                ),
                iconSize: 28,
              )
            ],
            elevation: 0,
          ),
          body: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 18),
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xFF2FD9E3).withOpacity(0.12),
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                          width: 1.5,
                          color: Color(0xFF2FD9E3),
                        ),
                      ),
                      child: Text(
                        state.bacaQuran.ayat?[index].ar ?? 'Tidak Ada Data',
                        textDirection: TextDirection.rtl,
                        style: GoogleFonts.poppins(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Text(
                      '${state.bacaQuran.ayat?[index].nomor}.  ${state.bacaQuran.ayat?[index].tr}',
                      style: GoogleFonts.poppins(
                          fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      state.bacaQuran.ayat?[index].idn ?? 'Tidak Ada',
                      style: GoogleFonts.poppins(
                          fontSize: 14, fontWeight: FontWeight.w300),
                    )
                  ],
                ),
              );
            },
            itemCount: state.bacaQuran.jumlahAyat,
            padding: EdgeInsets.zero,
          ),
        );
      },
    );
  }
}
