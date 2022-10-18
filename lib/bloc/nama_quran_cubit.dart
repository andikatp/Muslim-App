import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jadwal_solat/services/quran_service.dart';

import '../models/judul_quran_models.dart';

class NamaQuranCubit extends Cubit<NamaQuranState> {
  NamaQuranCubit() : super(NamaQuranState(dataSurah: []));

  void getData() async {
    var service = await QuranService().namaQuran();
    emit(NamaQuranState(dataSurah: service));
  }
}

class NamaQuranState {
  final List<NamaQuran> dataSurah;
  NamaQuranState({required this.dataSurah});
}
