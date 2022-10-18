import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jadwal_solat/models/isi_quran_models.dart';
import 'package:jadwal_solat/services/quran_service.dart';

class IsiQuranCubit extends Cubit<IsiQuranState> {
  IsiQuranCubit() : super(IsiQuranState(bacaQuran: BacaQuran()));

  void getIsi() async {
    var service = await QuranService().isiQuran();
    emit(IsiQuranState(bacaQuran: service));
  }
}

class IsiQuranState {
  final BacaQuran bacaQuran;
  IsiQuranState({required this.bacaQuran});
}
