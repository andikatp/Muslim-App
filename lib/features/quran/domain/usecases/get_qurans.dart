import 'package:jadwal_solat/core/usecase/usecase.dart';
import 'package:jadwal_solat/core/utils/typedef.dart';
import 'package:jadwal_solat/features/quran/domain/entities/quran_entity.dart';
import 'package:jadwal_solat/features/quran/domain/repositories/quran_repo.dart';

class GetQurans implements UseCaseWithoutParams<QuranEntity, void> {
  GetQurans({required QuranRepo repository}) : _repository = repository;
  final QuranRepo _repository;

  @override
  ResultFuture<QuranEntity> call() async {
    return _repository.getQurans();
  }
}
