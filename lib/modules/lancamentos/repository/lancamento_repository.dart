import 'package:app_gestao_de_gastos/models/lancamento_model.dart';
import 'package:app_gestao_de_gastos/repository/i_lancamento_repository.dart';
// import 'package:app_gestao_de_gastos/shared/access.dart';
import 'package:dio/dio.dart';

class LancamentoRepositoryDio implements ILancamentoRepository {

  final Dio _dio;
  final String url = "http://192.168.1.2:3000/";
  LancamentoRepositoryDio(this._dio);

  @override
  Future<List<LancamentoModel>> findAllLancamentos() async {
    try {
      //_dio.options.headers = {"Authorization": 'Bearer ${login.access}'};
      final response = await _dio.get<List>('${url}lancamentos/');
      final data = response.data?.map((e) => LancamentoModel.fromMap(e)).toList() ?? [];
      print("$data >>>");
      return data;
    } catch (e) {
      rethrow;
    }
  }
  
}