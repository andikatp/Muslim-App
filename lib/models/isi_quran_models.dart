// To parse this JSON data, do
//
//     final bacaQuran = bacaQuranFromJson(jsonString);

import 'dart:convert';

BacaQuran bacaQuranFromJson(String str) =>
    BacaQuran.fromJson(json.decode(str) as Map<String, dynamic>);

String bacaQuranToJson(BacaQuran data) => json.encode(data.toJson());

class BacaQuran {
  BacaQuran({
    this.nomor,
    this.nama,
    this.namaLatin,
    this.jumlahAyat,
    this.tempatTurun,
    this.arti,
    this.deskripsi,
    this.audio,
    this.status,
    this.ayat,
    this.suratSelanjutnya,
    this.suratSebelumnya,
  });

  factory BacaQuran.fromJson(Map<String, dynamic> json) => BacaQuran(
        nomor: json['nomor'] as int?,
        nama: json['nama'] as String?,
        namaLatin: json['nama_latin'] as String?,
        jumlahAyat: json['jumlah_ayat'] as int?,
        tempatTurun: json['tempat_turun'] as String?,
        arti: json['arti'] as String?,
        deskripsi: json['deskripsi'] as String?,
        audio: json['audio'] as String?,
        status: json['status'] as bool?,
        ayat: List<Ayats>.from(
          (json['ayat'] as List<Map<String, dynamic>>).map(Ayats.fromJson),
        ),
      );

  int? nomor;
  String? nama;
  String? namaLatin;
  int? jumlahAyat;
  String? tempatTurun;
  String? arti;
  String? deskripsi;
  String? audio;
  bool? status;
  List<Ayats>? ayat;
  SuratSenya? suratSelanjutnya;
  SuratSenya? suratSebelumnya;

  Map<String, dynamic> toJson() => {
        'nomor': nomor,
        'nama': nama,
        'nama_latin': namaLatin,
        'jumlah_ayat': jumlahAyat,
        'tempat_turun': tempatTurun,
        'arti': arti,
        'deskripsi': deskripsi,
        'audio': audio,
        'status': status,
        'ayat': List<dynamic>.from(ayat!.map((x) => x.toJson())),
        'surat_selanjutnya': null,
        'surat_sebelumnya': null,
      };
}

class Ayats {
  Ayats({
    this.id,
    this.surah,
    this.nomor,
    this.ar,
    this.tr,
    this.idn,
  });

  factory Ayats.fromJson(Map<String, dynamic> json) => Ayats(
        id: json['id'] as int?,
        surah: json['surah'] as int?,
        nomor: json['nomor'] as int?,
        ar: json['ar'] as String?,
        tr: json['tr'] as String?,
        idn: json['idn'] as String?,
      );

  int? id;
  int? surah;
  int? nomor;
  String? ar;
  String? tr;
  String? idn;

  Map<String, dynamic> toJson() => {
        'id': id,
        'surah': surah,
        'nomor': nomor,
        'ar': ar,
        'tr': tr,
        'idn': idn,
      };
}

class SuratSenya {
  SuratSenya({
    this.id,
    this.nomor,
    this.nama,
    this.namaLatin,
    this.jumlahAyat,
    this.tempatTurun,
    this.arti,
    this.deskripsi,
    this.audio,
  });

  factory SuratSenya.fromJson(Map<String, dynamic> json) => SuratSenya(
        id: json['id'] as int?,
        nomor: json['nomor'] as int?,
        nama: json['nama'] as String?,
        namaLatin: json['nama_latin'] as String?,
        jumlahAyat: json['jumlah_ayat'] as int?,
        tempatTurun: json['tempat_turun'] as String?,
        arti: json['arti'] as String?,
        deskripsi: json['deskripsi'] as String?,
        audio: json['audio'] as String?,
      );

  int? id;
  int? nomor;
  String? nama;
  String? namaLatin;
  int? jumlahAyat;
  String? tempatTurun;
  String? arti;
  String? deskripsi;
  String? audio;

  Map<String, dynamic> toJson() => {
        'id': id,
        'nomor': nomor,
        'nama': nama,
        'nama_latin': namaLatin,
        'jumlah_ayat': jumlahAyat,
        'tempat_turun': tempatTurun,
        'arti': arti,
        'deskripsi': deskripsi,
        'audio': audio,
      };
}
