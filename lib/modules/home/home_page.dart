import 'package:app_gestao_de_gastos/modules/home/Components/barra_menu.dart';
import 'package:app_gestao_de_gastos/modules/home/Components/cartao_banco_component.dart';
import 'package:app_gestao_de_gastos/modules/home/Components/outras_opcoes.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './home_controller.dart';
import 'Components/menu_lateral_component.dart';
import 'package:app_gestao_de_gastos/modules/home/home_controller.dart';

// ignore: use_key_in_widget_constructors
class HomePage extends GetView<HomeController> {
  List? bancos;
  

  @override
  Widget build(BuildContext context) {
    double _scremsizeH = MediaQuery.of(context).size.height;
    double _scremsizeW = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        automaticallyImplyLeading: true,
        title: const Text(
          'G C G'
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor:Theme.of(context).colorScheme.background,
      drawer: const MenuLateral(),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: [
              const BarraMenu(),
              Padding(
                padding: const EdgeInsets.only(top: 170, left: 10, right: 10),
                child: Stack(
                  children:[
                    Container(
                      height: 330,
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            color: Color.fromARGB(94, 0, 0, 0),
                            offset: Offset(5, 10),
                            spreadRadius: 0,
                          )
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        shape: BoxShape.rectangle,
                      ),
                      child: Stack(children: [
                        
                        _titulo( titulo:"Meus Bancos",context: context),
                        Divider(
                          height: 110,
                          // indent: 10,
                          // endIndent: 10,
                          thickness: 4,
                          color: Theme.of(context).colorScheme.background
                        ),
                        controller.obx((state) {
                          return Padding(
                            padding: const EdgeInsetsDirectional.only(top: 70, start: 10, end: 10, bottom: 10),
                            child: Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                shape: BoxShape.rectangle,
                              ),
                              height: 250,
                              child: PageView.builder(
                                
                                itemCount: state.length,
                                itemBuilder: (context, index){
                                  return CartaoBanco(
                                    scremsizeW: _scremsizeW,
                                    scremsizeH: _scremsizeH,
                                    banco: state[index],
                                  );
                                }

                                ),
                            ),
                          );
                          }, onError: (error) {
                            return _errorListarBancos(error, context);
                          }
                        )
                        
                      ],)
                    ),
                    
                    const OutrasOpcoes(),
                    
                    
                  ]
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _titulo({required String titulo, String? subtitulo, context}) {
    return ListTile(
      // leading: const Icon(
      //   Icons.call_to_action,
      //   color: Colors.blueGrey,
      // ),
      title: TextButton(
        onPressed: () => controller.findAllBancos(),
        child: Text(titulo,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    ) ;
  }

  _errorListarBancos(String? error, context) {
    return SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(error ?? '', style: Theme.of(context).textTheme.bodyMedium,),
                    TextButton(
                      onPressed: () => controller.findAllBancos(),
                      child: const Icon(
                        Icons.autorenew,
                        size: 35,
                        color: Colors.black54,
                      ),
                    )
                  ],
                ),
              );
  }


}

