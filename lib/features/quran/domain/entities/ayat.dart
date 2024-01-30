abstract class Ayat {
  const Ayat({
    required this.id,
    required this.ar,
    required this.tr,
    required this.idn,
  });

  const Ayat.empty() : this(id: 0, ar: '', tr: '', idn: '');

  final int id;
  final String ar;
  final String tr;
  final String idn;
}
