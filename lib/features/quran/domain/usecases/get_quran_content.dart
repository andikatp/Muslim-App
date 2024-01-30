import 'package:jadwal_solat/core/usecase/usecase.dart';
import 'package:jadwal_solat/core/utils/typedef.dart';
import 'package:jadwal_solat/features/quran/domain/entities/quran_content_entity.dart';
import 'package:jadwal_solat/features/quran/domain/repositories/quran_repo.dart';

class GetQuranContent implements UseCaseWithParams<QuranContentEntity, int> {
  GetQuranContent({required QuranRepo repository}) : _repository = repository;

  final QuranRepo _repository;
  @override
  ResultFuture<QuranContentEntity> call(int params) async {
    return _repository.getQuranContent(params);
  }
}
