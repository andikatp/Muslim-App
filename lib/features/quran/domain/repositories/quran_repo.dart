import 'package:jadwal_solat/core/utils/typedef.dart';
import 'package:jadwal_solat/features/quran/domain/entities/quran_content_entity.dart';
import 'package:jadwal_solat/features/quran/domain/entities/quran_entity.dart';

abstract class QuranRepo {
  const QuranRepo();

  ResultFuture<QuranEntity> getQurans();
  ResultFuture<QuranContentEntity> getQuranContent(int id);
}
