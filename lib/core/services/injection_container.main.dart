part of 'injection_container.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await _initPrayerTime();
  await _initQuran();
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
    ..registerLazySingleton(InternetConnection.new)
    ..registerLazySingleton(http.Client.new);
}

Future<void> _initQuran() async {
  sl
    ..registerFactory(() => QuranBloc(getQurans: sl(), getQuranContent: sl()))
    ..registerLazySingleton(() => GetQurans(repository: sl()))
    ..registerLazySingleton(() => GetQuranContent(repository: sl()))
    ..registerLazySingleton<QuranRepo>(
      () => QuranRepoImpl(networkInfo: sl(), remote: sl()),
    )
    ..registerLazySingleton<QuranRemoteDataSource>(
      () => QuranRemoteDataSourceImpl(client: sl()),
    );
}
