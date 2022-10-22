import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jadwal_solat/models/isi_quran_models.dart';
import 'package:jadwal_solat/services/quran_service.dart';

class IsiQuranCubit extends Cubit<IsiQuranState> {
  IsiQuranCubit() : super(IsiQuranState(bacaQuran: BacaQuran(), halaman: 1));

  int coba = 1;

  void getIsi(int halaman) async {
    var service = await QuranService().isiQuran(halaman: halaman);
    emit(IsiQuranState(bacaQuran: service, halaman: state.halaman));
  }
}

class IsiQuranState {
  final BacaQuran bacaQuran;
  final int halaman;
  IsiQuranState({required this.bacaQuran, required this.halaman});
}
