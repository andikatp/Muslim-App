import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jadwal_solat/core/constants/app_constant.dart';
import 'package:jadwal_solat/core/errors/exception.dart';
import 'package:jadwal_solat/core/utils/typedef.dart';
import 'package:jadwal_solat/features/prayer_time/data/models/prayer_time_model.dart';
import 'package:http/http.dart' as http;

abstract class PrayerTimeRemoteDataSource {
  const PrayerTimeRemoteDataSource();

  Future<PrayerTimeModel> getPrayerTime(
    String cityName,
    int year,
    int month,
    int date,
  );
}

class PrayerTimeRemoteDataSourceImpl implements PrayerTimeRemoteDataSource {
  PrayerTimeRemoteDataSourceImpl({required http.Client client})
      : _client = client;

  final http.Client _client;

  @override
  Future<PrayerTimeModel> getPrayerTime(
    String cityName,
    int year,
    int month,
    int date,
  ) async {
    try {
      final url = Uri.parse(
        '${AppConstant.baseUrl}/$year/$month/$date',
      );
      final response = await _client.get(url);
      if (response.statusCode != AppConstant.successfulHttpGetStatusCode) {
        throw ServerException(message: response.body);
      }
      final decode = jsonDecode(response.body) as ResultMap;
      final data =
          (decode['location'] as Map<String, dynamic>)['jadwal'] as ResultMap;
      final result = PrayerTimeModel.fromJson(data);
      return result;
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      throw ServerException(message: e.toString());
    }
  }
}
