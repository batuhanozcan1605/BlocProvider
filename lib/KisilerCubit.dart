import 'package:bloc_lecture/BlocListing/KisilerDaoRepository.dart';
import 'package:bloc_lecture/BlocListing/KisilerDurum.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class KisilerCubit extends Cubit<KisilerDurum> {
  KisilerRepository kisilerRepository;
  KisilerCubit(this.kisilerRepository):super(KisilerBaslangicSinifi());

  Future<void> kisileriAlveTetikle() async {
    try{
      emit(KisilerYukleniyor());

      var kisiListeCevap = await kisilerRepository.kisileriGetir();

      emit(KisilerYuklendi(kisiListeCevap));

    }catch(e){
      emit(KisilerHata("Kisiler Alınırken Hata Oluştu"));
    }
  }
}