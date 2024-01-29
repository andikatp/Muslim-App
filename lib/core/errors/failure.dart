
import 'package:equatable/equatable.dart';
import 'package:jadwal_solat/core/constants/app_constant.dart';
import 'package:jadwal_solat/core/errors/exception.dart';

abstract class Failure extends Equatable {
  const Failure({required this.message});
  final String message;

  @override
  List<Object?> get props => [];
  String get errorMessage => 'Error: $message';
}

class CacheFailure extends Failure {
  const CacheFailure({required super.message});

  CacheFailure.fromException(CacheException exception)
      : this(message: exception.message);
}

class ServerFailure extends Failure {
  const ServerFailure({required super.message});

  ServerFailure.fromException(ServerException exception)
      : this(message: exception.message);
}

class InternetFailure extends Failure {
  const InternetFailure() : super(message: AppConstant.noInternetConnection);
}
