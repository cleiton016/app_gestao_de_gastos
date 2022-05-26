import 'package:app_gestao_de_gastos/modules/home/home_bindings.dart';
import 'package:app_gestao_de_gastos/modules/home/home_page.dart';
import 'package:get/get.dart';

class HomeModule extends GetPage {
  HomeModule():
    super(
      name: 'home',
      page: () => HomePage(),
      binding: HomeBindings()
    );
}