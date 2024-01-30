import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jadwal_solat/core/constants/app_constant.dart';
import 'package:jadwal_solat/core/errors/exception.dart';
import 'package:jadwal_solat/core/utils/typedef.dart';
import 'package:jadwal_solat/features/quran/data/models/quran_content_model.dart';
import 'package:jadwal_solat/features/quran/data/models/quran_model.dart';

abstract class QuranRemoteDataSource {
  const QuranRemoteDataSource();
  Future<List<QuranModel>> getQurans();
  Future<QuranContentModel> getQuranContent(int id);
}

class QuranRemoteDataSourceImpl implements QuranRemoteDataSource {
  QuranRemoteDataSourceImpl({required http.Client client}) : _client = client;
  final http.Client _client;

  @override
  Future<List<QuranModel>> getQurans() async {
    try {
      final url = Uri.parse(AppConstant.baseQuranUrl);
      final response = await _client.get(url);
      if (response.statusCode != 200) {
        throw ServerException(message: response.body);
      }
      final decode = jsonDecode(response.body) as List<dynamic>;
      return decode.map((e) =>  QuranModel.fromJson(e as ResultMap)).toList();
    } catch (e, s) {
      debugPrint(s.toString());
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<QuranContentModel> getQuranContent(int id) async {
    try {
      final url = Uri.parse('${AppConstant.baseQuranUrl}/$id');
      final response = await _client.get(url);
      if (response.statusCode != 200) {
        throw ServerException(message: response.body);
      }
      final decode = jsonDecode(response.body) as ResultMap;
      return QuranContentModel.fromJson(decode);
    } catch (e, s) {
      debugPrint(s.toString());
      throw ServerException(message: e.toString());
    }
  }
}
