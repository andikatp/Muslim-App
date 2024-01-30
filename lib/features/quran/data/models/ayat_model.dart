import 'package:jadwal_solat/core/utils/typedef.dart';
import 'package:jadwal_solat/features/quran/domain/entities/ayat.dart';

class AyatModel extends AyatEntity {
  AyatModel({
    required super.id,
    required super.ar,
    required super.tr,
    required super.idn,
  });

  const AyatModel.empty() : super.empty();

  factory AyatModel.fromJson(ResultMap json) {
    return AyatModel(
      id: json['id'] as int,
      ar: json['ar'] as String,
      tr: json['tr'] as String,
      idn: json['idn'] as String,
    );
  }

  ResultMap toJson() {
    return {
      'id': id,
      'ar': ar,
      'tr': tr,
      'idn': idn,
    };
  }
}
