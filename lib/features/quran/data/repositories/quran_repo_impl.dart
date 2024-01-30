import 'package:dartz/dartz.dart';
import 'package:jadwal_solat/core/errors/failure.dart';
import 'package:jadwal_solat/core/network_info/network_info.dart';
import 'package:jadwal_solat/core/utils/typedef.dart';
import 'package:jadwal_solat/features/quran/data/datasources/quran_remote_data_source.dart';
import 'package:jadwal_solat/features/quran/data/models/quran_content_model.dart';
import 'package:jadwal_solat/features/quran/data/models/quran_model.dart';
import 'package:jadwal_solat/features/quran/domain/repositories/quran_repo.dart';

class QuranRepoImpl implements QuranRepo {
  QuranRepoImpl({
    required NetworkInfo networkInfo,
    required QuranRemoteDataSource remote,
  })  : _networkInfo = networkInfo,
        _remote = remote;

  final NetworkInfo _networkInfo;
  final QuranRemoteDataSource _remote;

  @override
  ResultFuture<List<QuranModel>> getQurans() async {
    if (!await _networkInfo.isConnected) {
      return const Left(InternetFailure());
    }
    final result = await _remote.getQurans();
    return Right(result);
  }

  @override
  ResultFuture<QuranContentModel> getQuranContent(int id) async {
    if (!await _networkInfo.isConnected) {
      return const Left(InternetFailure());
    }
    final result = await _remote.getQuranContent(id);
    return Right(result);
  }
}
