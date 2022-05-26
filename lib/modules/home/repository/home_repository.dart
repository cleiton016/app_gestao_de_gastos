import 'package:app_gestao_de_gastos/models/bancos_model.dart';
import 'package:app_gestao_de_gastos/repository/i_home_repository.dart';
// import 'package:app_gestao_de_gastos/shared/access.dart';
import 'package:dio/dio.dart';

class HomeRepositoryDio implements IHomeRepository {

  final Dio _dio;
  final String url = "http://192.168.1.2:3000/";
  HomeRepositoryDio(this._dio);

  @override
  Future<List<BancosModel>> findAllBancos() async {
    try {
      //_dio.options.headers = {"Authorization": 'Bearer ${login.access}'};
      final response = await _dio.get<List>('${url}bancos');
      return response.data?.map((e) => BancosModel.fromMap(e)).toList() ?? [];
    } catch (e) {
      rethrow;
    }
  }
  
}