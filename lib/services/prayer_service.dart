import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jadwal_solat/models/prayer_time_api_model.dart';

class PrayerService {
  Future<Value> getPrayerTime() async {
    http.Response response = await http.get(
        Uri.parse('https://api.myquran.com/v1/sholat/jadwal/1609/2022/10/13'));
    var getData = jsonDecode(response.body); // mengembalikan semua map

    if (response.statusCode == 200) {
      var data = PrayerData.fromJson(getData);
      if (data.value == null) throw ('Data tidak Ada');
      return data.value!;
    } else {
      throw ('Error code : ' + response.statusCode.toString());
    }
  }
}
