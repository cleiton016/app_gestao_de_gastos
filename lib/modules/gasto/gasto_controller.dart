import 'package:app_gestao_de_gastos/models/GastoModel.dart';
import 'package:app_gestao_de_gastos/repository/i_gasto_repository.dart';
import 'package:get/get.dart';

class GastoController extends GetxController with StateMixin {
  final IGastoRepository _gastoRepository;

  GastoController(this._gastoRepository);
  
  Future<void> addGasto(GastoModel data) async {
    change([], status: RxStatus.loading());
    try {
      final dados = await _gastoRepository.addGasto(data);
      change(dados, status: RxStatus.success());
    } catch (e) {
      print( '$e ----');
      change([], status: RxStatus.error('Erro ao buscar bancos'));
    }
  }


}