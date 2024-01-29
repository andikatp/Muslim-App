import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

abstract class NetworkInfo {
  const NetworkInfo();
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  NetworkInfoImpl({required InternetConnection networkInfo})
      : _networkInfo = networkInfo;

  final InternetConnection _networkInfo;

  @override
  Future<bool> get isConnected => _networkInfo.hasInternetAccess;
}
