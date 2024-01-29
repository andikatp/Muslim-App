part of 'injection_container.dart';

final sl = GetIt.instance;

void main() async {
  await _initPrayerTime();
}

Future<void> _initPrayerTime() async {
  sl
    ..registerFactory(() => PrayerTimeBloc(getPrayerTime: sl()))
    ..registerLazySingleton(() => GetPrayerTime(repository: sl()))
    ..registerLazySingleton<PrayerTimeRepo>(
      () => PrayerTimeRepoImpl(dataSource: sl(), networkInfo: sl()),
    )
    ..registerLazySingleton<PrayerTimeRemoteDataSource>(
      () => PrayerTimeRemoteDataSourceImpl(client: sl()),
    )
    ..registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(networkInfo: sl()),
    )
    ..registerLazySingleton(() => InternetConnection.new)
    ..registerLazySingleton(() => http.Client.new);
}
