import 'package:app_gestao_de_gastos/models/GastoModel.dart';

abstract class IGastoRepository {
  Future <bool> addGasto(GastoModel data);
  Future <List> getCategorias();
}