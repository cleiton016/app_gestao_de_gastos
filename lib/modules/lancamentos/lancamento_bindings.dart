
import 'package:app_gestao_de_gastos/modules/lancamentos/repository/lancamento_repository.dart';
import 'package:app_gestao_de_gastos/repository/i_lancamento_repository.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'lancamento_controller.dart';

class LancamentoBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(Dio());
    Get.put<ILancamentoRepository>(LancamentoRepositoryDio(Get.find()));
    Get.put(LancamentoController(Get.find()));
  }
}
