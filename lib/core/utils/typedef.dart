import 'package:dartz/dartz.dart';
import 'package:jadwal_solat/core/errors/failure.dart';

typedef ResultFuture<Type> = Future<Either<Failure, Type>>;
typedef ResultMap = Map<String, dynamic>;
