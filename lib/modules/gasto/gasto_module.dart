import 'package:app_gestao_de_gastos/modules/gasto/gasto_bindings.dart';
import 'package:app_gestao_de_gastos/modules/gasto/gasto_page.dart';
import 'package:get/get.dart';

class GastoModule extends GetPage {
  GastoModule():
    super(
      name: '/gasto',
      page: () => GastoPage(),
      binding: GastoBindings()
    );
}