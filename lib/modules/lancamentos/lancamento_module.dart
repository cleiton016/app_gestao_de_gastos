import 'package:app_gestao_de_gastos/modules/lancamentos/lancamento_bindings.dart';
import 'package:app_gestao_de_gastos/modules/lancamentos/lancamento_page.dart';
import 'package:get/route_manager.dart';


class LancamentoModule extends GetPage {
  LancamentoModule()
      : super(
          name: '/lancamentos',
          page: () => LancamentoPage(),
          binding: LancamentoBindings(),
          // children: [
          //   GetPage(
          //     name: '/dio',
          //     page: () => DioPage(),
          //     binding: DioBindings(),
          //   ),
          // ],
        );
}
