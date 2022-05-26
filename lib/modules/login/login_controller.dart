import 'package:app_gestao_de_gastos/models/login_model.dart';
import 'package:app_gestao_de_gastos/repository/i_login_repository.dart';
import 'package:app_gestao_de_gastos/shared/access.dart';
import 'package:get/get.dart';

class LoginController extends GetxController with StateMixin { 

  final ILoginRepository _loginRepository;

  LoginController(this._loginRepository);

  @override
  void onInit() {
    super.onInit();
    findLogin();
  }

  Future<void> findLogin() async {
    change([], status: RxStatus.loading());
    try {
      await _loginRepository.findLogin();
    } catch (e) {
      print( '$e ----');
      change([], status: RxStatus.error('Erro de autenticação'));
    }
  }

}