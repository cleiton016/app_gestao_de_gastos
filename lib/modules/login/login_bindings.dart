import 'package:app_gestao_de_gastos/modules/login/login_controller.dart';
import 'package:app_gestao_de_gastos/modules/login/repository/login_repository.dart';
import 'package:app_gestao_de_gastos/repository/i_login_repository.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class LoginBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(Dio());
    Get.put<ILoginRepository>(LoginRepositoryDio(Get.find()));
    Get.put(LoginController(Get.find()));
  }
}