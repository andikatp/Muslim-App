

import 'package:jadwal_solat/core/constants/app_constant.dart';
import 'package:jadwal_solat/core/errors/failure.dart';

String errorMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return AppConstant.serverFailureMessage;
    case CacheFailure:
      return AppConstant.cacheFailureMessage;
    default:
      return AppConstant.generalFailureMessage;
  }
}
