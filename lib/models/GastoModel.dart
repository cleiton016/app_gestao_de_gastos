// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

import 'package:app_gestao_de_gastos/models/CategoriaModel.dart';

class GastoModel {
  int? id;
  String nome;
  String valor;
  DateTime data_referente;
  CategoriaModel? categoria_fk;
  
  GastoModel({
    this.id,
    required this.nome,
    required this.valor,
    required this.data_referente,
    this.categoria_fk,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nome': nome,
      'valor': valor,
      'data_referente': data_referente.millisecondsSinceEpoch,
      'categoria_fk': categoria_fk?.toMap(),
    };
  }

  factory GastoModel.fromMap(Map<String, dynamic> map) {
    return GastoModel(
      id: map['id'] as int,
      nome: map['nome'] as String,
      valor: map['valor'] as String,
      data_referente: DateTime.parse(map['data_referente']),
      categoria_fk: map['categoria_fk'] != null ? CategoriaModel.fromMap(map['categoria_fk'] as Map<String,dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GastoModel.fromJson(String source) => GastoModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
