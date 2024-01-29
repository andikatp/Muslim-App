import 'dart:convert';

List<NamaQuran> namaQuranFromJson(String str) =>
    List<NamaQuran>.from(json.decode(str).map(NamaQuran.fromJson));

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
        nomor: json['nomor'],
        nama: json['nama'],
        namaLatin: json['nama_latin'],
        jumlahAyat: json['jumlah_ayat'],
        tempatTurun:
            tempatTurunValues.map[json['tempat_turun']] ?? TempatTurun.MADINAH,
        arti: json['arti'],
        deskripsi: json['deskripsi'],
        audio: json['audio'],
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
  late Map<T, String> reverseMap;

  Map<T, String> get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
