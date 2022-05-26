// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:app_gestao_de_gastos/models/lancamento_model.dart';


abstract class ILancamentoRepository {

  Future<List<LancamentoModel>> findAllLancamentos();
  
}
