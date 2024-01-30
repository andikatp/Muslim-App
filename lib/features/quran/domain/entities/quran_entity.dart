import 'package:equatable/equatable.dart';

abstract class QuranEntity extends Equatable {
  const QuranEntity({
    required this.nomor,
    required this.nama,
    required this.namaLatin,
    required this.jumlahAyat,
    required this.arti,
  });

  const QuranEntity.empty()
      : this(
          nomor: 0,
          nama: '',
          namaLatin: '',
          jumlahAyat: 0,
          arti: '',
        );

  final int nomor;
  final String nama;
  final String namaLatin;
  final int jumlahAyat;
  final String arti;

  @override
  List<Object> get props => [nomor, nama, namaLatin, jumlahAyat, arti];
}
