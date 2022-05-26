
import 'package:app_gestao_de_gastos/repository/i_lancamento_repository.dart';
import 'package:get/get.dart';

class LancamentoController extends GetxController with StateMixin { 

  final ILancamentoRepository _lancamentoRepository;

  LancamentoController(this._lancamentoRepository);

  @override
  void onInit() {
    super.onInit();
    findLancamentos();
  }

  Future<void> findLancamentos() async {
    change([], status: RxStatus.loading());
    try {
      final dados = await _lancamentoRepository.findAllLancamentos();
      print(dados);
      change(dados, status: RxStatus.success());
    } catch (e) {
      print( '$e ----');
      change([], status: RxStatus.error('Erro ao buscar usuários'));
    }
  }

}