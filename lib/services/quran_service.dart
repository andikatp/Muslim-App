import 'dart:convert';

import 'package:jadwal_solat/models/isi_quran_models.dart';
import 'package:jadwal_solat/models/judul_quran_models.dart';
import 'package:http/http.dart' as http;

class QuranService {
  Future<List<NamaQuran>> namaQuran() async {
    var url = Uri.parse('https://equran.id/api/surat');
    http.Response response = await http.get(url);
    var body = jsonDecode(response.body);
    if (response.statusCode == 200) {
      var data = (body as List).map((i) => NamaQuran.fromJson(i)).toList();
      return data;
    } else {
      throw ('Error code : ${response.statusCode}');
    }
  }

  Future<BacaQuran> isiQuran() async {
    var url = Uri.parse('https://equran.id/api/surat/2');
    http.Response response = await http.get(url);
    var body = jsonDecode(response.body);
    if (response.statusCode == 200) {
      var data = BacaQuran.fromJson(body);
      return data;
    } else {
      throw ('Error code : ${response.statusCode}');
    }
  }
}
