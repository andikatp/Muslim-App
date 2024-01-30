import 'package:jadwal_solat/features/quran/domain/entities/ayat.dart';

abstract class QuranContentEntity {
  const QuranContentEntity({
    required this.nomor,
    required this.namaLatin,
    required this.ayat,
  });

  QuranContentEntity.empty() : this(nomor: 1, namaLatin: '', ayat: []);

  final int nomor;
  final String namaLatin;
  final List<Ayat> ayat;
}
