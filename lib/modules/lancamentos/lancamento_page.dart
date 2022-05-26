import 'package:app_gestao_de_gastos/models/lancamento_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'lancamento_controller.dart';

class LancamentoPage extends GetView<LancamentoController> {
   @override
   Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: const Text('Lançamentos'),
      ),
      body: controller.obx((state) {
        return Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 100),
          child: ListView.builder(
            itemCount: state.length,
            itemBuilder: (_, index) {
              final LancamentoModel item = state[index];
              return Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: const Color(0xFFFFFFFF),
                child: ListTile(
                  title: Text(
                    item.mes,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  subtitle: Text(item.ano),
                ),
              );
            },
            
            scrollDirection: Axis.vertical,
          ),
        );
      }, onError: (error) {
        return SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(error ?? ''),
              TextButton(
                onPressed: () => controller.findLancamentos(),
                child: const Text('Tentar novamente'),
              )
            ],
          ),
        );
      }
      ),
    );
  }
}