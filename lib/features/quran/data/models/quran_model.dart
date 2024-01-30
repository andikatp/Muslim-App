import 'package:jadwal_solat/core/utils/typedef.dart';
import 'package:jadwal_solat/features/quran/domain/entities/quran_entity.dart';

class QuranModel extends QuranEntity {
  QuranModel({
    required super.nomor,
    required super.nama,
    required super.namaLatin,
    required super.jumlahAyat,
    required super.arti,
  });

  const QuranModel.empty() : super.empty();

  factory QuranModel.fromJson(ResultMap json) {
    return QuranModel(
      nomor: json['nomor'] as int,
      nama: json['nama'] as String,
      namaLatin: json['nama_latin'] as String,
      jumlahAyat: json['jumlah_ayat'] as int,
      arti: json['arti'] as String,
    );
  }

  ResultMap toJson() {
    return {
      'nomor': nomor,
      'nama': nama,
      'nama_latin': namaLatin,
      'jumlah_ayat': jumlahAyat,
      'arti': arti,
    };
  }
}
