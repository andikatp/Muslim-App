import 'package:equatable/equatable.dart';

class CacheException extends Equatable implements Exception {
  const CacheException({required this.message});
  final String message;

  @override
  List<Object?> get props => [message];
}

class ServerException extends Equatable implements Exception {
  const ServerException({required this.message});
  final String message;

  @override
  List<String?> get props => [message];
}
