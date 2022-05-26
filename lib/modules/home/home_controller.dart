import 'package:app_gestao_de_gastos/repository/i_home_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with StateMixin {
  final IHomeRepository _homeRepository;

  HomeController(this._homeRepository);
  
  @override
  void onInit() {
    super.onInit();
    findAllBancos();
  }

  Future<void> findAllBancos() async {
    change([], status: RxStatus.loading());
    try {
      final dados = await _homeRepository.findAllBancos();
      change(dados, status: RxStatus.success());
    } catch (e) {
      print( '$e ----');
      change([], status: RxStatus.error('Erro ao buscar bancos'));
    }
  }

  
}