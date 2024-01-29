import 'package:dartz/dartz.dart';
import 'package:jadwal_solat/core/errors/failure.dart';
import 'package:jadwal_solat/core/network_info/network_info.dart';
import 'package:jadwal_solat/core/utils/typedef.dart';
import 'package:jadwal_solat/features/prayer_time/data/datasources/prayer_time_remote_data_source.dart';
import 'package:jadwal_solat/features/prayer_time/domain/entities/prayer_time_entity.dart';
import 'package:jadwal_solat/features/prayer_time/domain/repositories/prayer_time_repo.dart';

class PrayerTimeRepoImpl implements PrayerTimeRepo {
  PrayerTimeRepoImpl({
    required PrayerTimeRemoteDataSource dataSource,
    required NetworkInfo networkInfo,
  })  : _dataSource = dataSource,
        _networkInfo = networkInfo;

  final PrayerTimeRemoteDataSource _dataSource;
  final NetworkInfo _networkInfo;

  @override
  ResultFuture<PrayerTimeEntity> getPrayerTime(
    int year,
    int month,
    int date,
  ) async {
    if (!await _networkInfo.isConnected) {
      return const Left(InternetFailure());
    }
    final result = await _dataSource.getPrayerTime(year, month, date);
    return Right(result);
  }
}
