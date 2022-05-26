import 'package:app_gestao_de_gastos/models/bancos_model.dart';

abstract class IHomeRepository {
  Future<List<BancosModel>> findAllBancos();
}