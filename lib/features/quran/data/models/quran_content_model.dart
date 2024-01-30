import 'package:jadwal_solat/core/utils/typedef.dart';
import 'package:jadwal_solat/features/quran/data/models/ayat_model.dart';
import 'package:jadwal_solat/features/quran/domain/entities/quran_content_entity.dart';

class QuranContentModel extends QuranContentEntity {
  QuranContentModel({
    required super.nomor,
    required super.namaLatin,
    required super.ayat,
  });

  QuranContentModel.empty() : super.empty();

  factory QuranContentModel.fromJson(ResultMap json) {
    return QuranContentModel(
      nomor: json['nomor'] as int,
      namaLatin: json['nama_latin'] as String,
      ayat: (json['ayat'] as List<ResultMap>).map(AyatModel.fromJson).toList(),
    );
  }

  ResultMap toJson() {
    return {
      'nomor': nomor,
      'nama_latin': namaLatin,
      'ayat': ayat,
    };
  }
}
