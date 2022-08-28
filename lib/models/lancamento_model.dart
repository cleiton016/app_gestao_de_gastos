// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

class LancamentoModel {
  int id;
  String mes;
  String ano;
  DateTime criado_em;
  DateTime ultima_alteracao;
  // int usuarioFK;
  // int bancoFK;
  
  LancamentoModel({
    required this.id,
    required this.mes,
    required this.ano,
    required this.criado_em,
    required this.ultima_alteracao,
  });
  
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'mes': mes,
      'ano': ano,
      'criado_em': criado_em.millisecondsSinceEpoch,
      'ultima_alteracao': ultima_alteracao.millisecondsSinceEpoch,
    };
  }

  factory LancamentoModel.fromMap(Map<String, dynamic> map) {
    return LancamentoModel(
      id: map['id'] as int,
      mes: map['mes'] as String,
      ano: map['ano'] as String,
      criado_em: DateTime.parse(map['criado_em']),
      ultima_alteracao: DateTime.parse(map['ultima_alteracao']),
    );
  }

  String toJson() => json.encode(toMap());

  factory LancamentoModel.fromJson(String source) => LancamentoModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
