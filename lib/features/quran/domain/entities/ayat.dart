import 'package:equatable/equatable.dart';

abstract class AyatEntity extends Equatable {
  const AyatEntity({
    required this.id,
    required this.ar,
    required this.tr,
    required this.idn,
  });

  const AyatEntity.empty() : this(id: 0, ar: '', tr: '', idn: '');

  final int id;
  final String ar;
  final String tr;
  final String idn;

  @override
  List<Object> get props => [id, ar, tr, idn];
}
