import 'package:app_gestao_de_gastos/modules/lancamentos/lancamento_bindings.dart';
import 'package:app_gestao_de_gastos/modules/lancamentos/lancamento_page.dart';
import 'package:app_gestao_de_gastos/modules/login/login_bindings.dart';
import 'package:app_gestao_de_gastos/modules/login/login_page.dart';
import 'package:get/route_manager.dart';


class LoginModule extends GetPage {
  LoginModule()
      : super(
          name: '/login',
          page: () => LoginPage(),
          binding: LoginBindings(),
          // children: [
          //   GetPage(
          //     name: '/dio',
          //     page: () => DioPage(),
          //     binding: DioBindings(),
          //   ),
          // ],
        );
}
