import 'package:app_gestao_de_gastos/models/CategoriaModel.dart';
import 'package:app_gestao_de_gastos/models/GastoModel.dart';
import 'package:app_gestao_de_gastos/repository/i_gasto_repository.dart';
import 'package:dio/dio.dart';

class GastoRepositoryDio implements IGastoRepository {
  final Dio _dio;
  final String url = "http://192.168.1.2:3000/";
  GastoRepositoryDio(this._dio);

  @override
  Future <bool> addGasto(GastoModel data) async {
    try {
      //_dio.options.headers = {"Authorization": 'Bearer ${login.access}'};
      final response = await _dio.post(
        '${url}gasto',
        data: data.toJson()
      );
      
      return response.statusCode == 200;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future <List> getCategorias() async {
    try {
      final response = await _dio.get<List>("${url}categorias");
      return response.data?.map((e) => CategoriaModel.fromMap(e)).toList()?? [];
    } catch(e){
      rethrow;
    }
  }
}