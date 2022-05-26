

import 'package:app_gestao_de_gastos/modules/home/home_controller.dart';
import 'package:app_gestao_de_gastos/modules/home/repository/home_repository.dart';
import 'package:app_gestao_de_gastos/repository/i_home_repository.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class HomeBindings implements Bindings {
    @override
    void dependencies() {
      Get.put(Dio());
      Get.put<IHomeRepository>(HomeRepositoryDio(Get.find()));
      Get.put(HomeController(Get.find()));
    }
}