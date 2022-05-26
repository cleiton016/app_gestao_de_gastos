import 'package:app_gestao_de_gastos/models/login_model.dart';
import 'package:app_gestao_de_gastos/repository/i_login_repository.dart';
import 'package:app_gestao_de_gastos/shared/access.dart';
import 'package:dio/dio.dart';

class LoginRepositoryDio implements ILoginRepository {

  final Dio _dio;
  final String url = "http://teste-deploy-env.eba-uyuinkiq.us-west-2.elasticbeanstalk.com/";

  LoginRepositoryDio(this._dio);

  @override
  Future<LoginModel> findLogin() async {
    try {
      _dio.options.headers = {"Content-Type": 'application/json'};
      final response = await _dio.post(
        '${url}api/token/',
        data: {
          'username':'050.907.221-61',
          'password':'ClB84115245'
        }
      );
      login = LoginModel.fromMap(response.data);
      return login;
    } catch (e) {
      rethrow;
    }
  }
  
}