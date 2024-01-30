import 'package:jadwal_solat/features/quran/data/models/quran_content_model.dart';
import 'package:jadwal_solat/features/quran/data/models/quran_model.dart';
import 'package:http/http.dart' as http;

abstract class QuranRemoteDataSource {
  const QuranRemoteDataSource();
  QuranModel getQurans();
  QuranContentModel getQuranContent(int id);
}

class QuranRemoteDataSourceImpl implements QuranRemoteDataSource {
  QuranRemoteDataSourceImpl({required http.Client client}) : _client = client;

  final http.Client _client;

  @override
  QuranContentModel getQuranContent(int id) {
    // TODO: implement getQuranContent
    throw UnimplementedError();
  }

  @override
  QuranModel getQurans() {
    // TODO: implement getQurans
    throw UnimplementedError();
  }
}
