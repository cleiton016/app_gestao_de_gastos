import 'package:app_gestao_de_gastos/models/GastoModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
    
class BarraMenu extends StatelessWidget {

  const BarraMenu({ Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 2.5,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft:  Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Container(
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
            topLeft: Radius.circular(0),
            topRight: Radius.circular(0),
          ),
          shape: BoxShape.rectangle,
        ),
        child: _infoMenu(context),
      ),
    );
  }

    _infoMenu(context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        _ultimoLancamento(),
        _opcoesMenu(context),
      ],
    );
  }

  _opcoesMenu(context) {
    return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: 120,
            height: 45,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  blurRadius: 10,
                  color: Color.fromARGB(255, 0, 0, 0),
                  offset: Offset(5, 10),
                  spreadRadius: 0,
                )
              ],
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(
                color: const Color(0xFFFFFFFF),
                width: 2.0,
              ),
            ),
            child: TextButton(
              onPressed: () => Get.toNamed('/lancamentos'),
              child: Text(
                'Faturas',
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).primaryColor
                ),
              ),
            ),
          ),
          Container(
            width: 120,
            height: 45,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(
                color: const Color(0xFFFFFFFF),
                width: 2.0,
              ),
            ),
            child: TextButton(
              onPressed: () => Get.toNamed('/gasto'),
              child: const Text(
                'Lançar',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white
                ),
              ),
            ),
          ),
        ],
      );
  }

  _ultimoLancamento() {
    final GastoModel data = GastoModel(id: 0, nome: "Cerveja", valor: "42,80", data_referente: DateTime.now());
    return Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 30),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const Text("Ultimo Lançamento", style: TextStyle(fontSize: 15, color: Colors.white),),
                Text(
                  "${data.nome} R\$: ${data.valor}",
                  style: const TextStyle(
                    color: Colors.white
                  )
                ),
              ],
            ),
          ],
        ),
      );
  }
}