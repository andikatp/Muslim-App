import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jadwal_solat/models/prayer_time_api_model.dart';

class PrayerService {
  Future<Value> getPrayerTime(
      {int tahun = 2022, int bulan = 01, int tanggal = 01}) async {
    final uri = Uri.parse(
        'https://api.myquran.com/v1/sholat/jadwal/0119/$tahun/$bulan/$tanggal');
    http.Response response = await http.get(uri);
    var getData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      var data = PrayerData.fromJson(getData);
      if (data.value == null) throw ('Data tidak Ada');
      return data.value!;
    } else {
      throw ('Error code : ${response.statusCode}');
    }
  }
}
