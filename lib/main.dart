import 'package:app_gestao_de_gastos/modules/gasto/gasto_module.dart';
import 'package:app_gestao_de_gastos/modules/home/home_bindings.dart';
import 'package:app_gestao_de_gastos/modules/home/home_page.dart';
import 'package:app_gestao_de_gastos/modules/lancamentos/lancamento_module.dart';
import 'package:app_gestao_de_gastos/modules/login/login_module.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF2B2B2B),
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          background: Color(0xFFDFDEDE),
          primary: Color(0xFF2B2B2B), 
          secondary: Color.fromARGB(255, 255, 255, 255), 
          surface: Color.fromARGB(255, 19, 111, 165),
          error: Color(0xFF2B2B2B),
          onBackground: Color(0xFF2B2B2B),
          onPrimary: Color(0xFFDFDEDE),
          onSecondary: Color(0xFF2B2B2B),
          onSurface: Color(0xFF2B2B2B),
          onError: Color.fromARGB(255, 250, 64, 64),

        )
      ),
      initialRoute: '/home',
      getPages: [
        GetPage(
          name: '/home',
          page: () => HomePage(),
          binding: HomeBindings()
        ),
        LancamentoModule(),
        GastoModule(),
        LoginModule()
      ],
    );
  }
}