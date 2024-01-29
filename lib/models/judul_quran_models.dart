import 'dart:convert';

import 'package:jadwal_solat/core/utils/typedef.dart';

List<NamaQuran> namaQuranFromJson(String str) => List<NamaQuran>.from(
      (json.decode(str) as List<ResultMap>).map(NamaQuran.fromJson),
    );

String namaQuranToJson(List<NamaQuran> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NamaQuran {
  NamaQuran({
    required this.nomor,
    required this.nama,
    required this.namaLatin,
    required this.jumlahAyat,
    required this.tempatTurun,
    required this.arti,
    required this.deskripsi,
    required this.audio,
  });

  factory NamaQuran.fromJson(Map<String, dynamic> json) => NamaQuran(
        nomor: json['nomor'] as int,
        nama: json['nama'] as String,
        namaLatin: json['nama_latin'] as String,
        jumlahAyat: json['jumlah_ayat'] as int,
        tempatTurun:
            tempatTurunValues.map[json['tempat_turun']] ?? TempatTurun.MADINAH,
        arti: json['arti'] as String,
        deskripsi: json['deskripsi'] as String,
        audio: json['audio'] as String,
      );

  int nomor;
  String nama;
  String namaLatin;
  int jumlahAyat;
  TempatTurun tempatTurun;
  String arti;
  String deskripsi;
  String audio;

  Map<String, dynamic> toJson() => {
        'nomor': nomor,
        'nama': nama,
        'nama_latin': namaLatin,
        'jumlah_ayat': jumlahAyat,
        'tempat_turun': tempatTurunValues.reverse[tempatTurun],
        'arti': arti,
        'deskripsi': deskripsi,
        'audio': audio,
      };
}

enum TempatTurun { MEKAH, MADINAH }

final tempatTurunValues =
    EnumValues({'madinah': TempatTurun.MADINAH, 'mekah': TempatTurun.MEKAH});

class EnumValues<T> {
  EnumValues(this.map);
  Map<String, T> map;
  late Map<T, String>? reverseMap;

  Map<T, String> get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap!;
  }
}
