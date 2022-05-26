import 'package:app_gestao_de_gastos/modules/gasto/repository/gasto_repository_dio.dart';
import 'package:app_gestao_de_gastos/repository/i_gasto_repository.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import './gasto_controller.dart';

class GastoBindings implements Bindings {
    @override
    void dependencies() {
      Get.put(Dio());
      Get.put<IGastoRepository>(GastoRepositoryDio(Get.find()));
      Get.put(GastoController(Get.find()));
    }
}