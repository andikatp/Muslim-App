import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:jadwal_solat/core/utils/typedef.dart';
import 'package:jadwal_solat/models/isi_quran_models.dart';
import 'package:jadwal_solat/models/judul_quran_models.dart';

class QuranService {
  Future<List<NamaQuran>> namaQuran() async {
    final url = Uri.parse('https://equran.id/api/surat');
    final response = await http.get(url);
    final body = jsonDecode(response.body);
    if (response.statusCode == 200) {
      final data = (body as List<ResultMap>).map(NamaQuran.fromJson).toList();
      return data;
    } else {
      throw 'Error code : ${response.statusCode}';
    }
  }

  Future<BacaQuran> isiQuran({int halaman = 1}) async {
    final url = Uri.parse('https://equran.id/api/surat/$halaman');
    final response = await http.get(url);
    final body = jsonDecode(response.body);
    if (response.statusCode == 200) {
      final data = BacaQuran.fromJson(body as ResultMap);
      return data;
    } else {
      throw 'Error code : ${response.statusCode}';
    }
  }
}
