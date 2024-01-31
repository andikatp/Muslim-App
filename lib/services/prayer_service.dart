import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jadwal_solat/core/utils/typedef.dart';
import 'package:jadwal_solat/features/prayer_time/data/models/prayer_time_model.dart';

class PrayerService {
  Future<PrayerTimeModel> getPrayerTime({
    int tahun = 2022,
    int bulan = 01,
    int tanggal = 01,
  }) async {
    final uri = Uri.parse(
      'https://api.myquran.com/v2/sholat/jadwal/0119/$tahun/$bulan/$tanggal',
    );
    final response = await http.get(uri);
    final getData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      final data = PrayerTimeModel.fromJson(
        (getData['data'] as ResultMap)['jadwal'] as ResultMap,
      );
      return data;
    } else {
      throw Exception('Error code : ${response.statusCode}');
    }
  }
}
