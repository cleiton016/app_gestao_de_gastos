
import 'package:app_gestao_de_gastos/models/login_model.dart';

abstract class ILoginRepository {
  
  Future<LoginModel> findLogin();
  
}