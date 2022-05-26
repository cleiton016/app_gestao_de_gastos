// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LancamentoModel {
  int id;
  String mes;
  String ano;
  DateTime criadoEm;
  DateTime ultimaAlteracao;
  // int usuarioFK;
  // int bancoFK;
  
  LancamentoModel({
    required this.id,
    required this.mes,
    required this.ano,
    required this.criadoEm,
    required this.ultimaAlteracao,
  });
  
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'mes': mes,
      'ano': ano,
      'criadoEm': criadoEm.millisecondsSinceEpoch,
      'ultimaAlteracao': ultimaAlteracao.millisecondsSinceEpoch,
    };
  }

  factory LancamentoModel.fromMap(Map<String, dynamic> map) {
    return LancamentoModel(
      id: map['id'] as int,
      mes: map['mes'] as String,
      ano: map['ano'] as String,
      criadoEm: DateTime.parse(map['criado_em']),
      ultimaAlteracao: DateTime.parse(map['ultima_alteracao']),
    );
  }

  String toJson() => json.encode(toMap());

  factory LancamentoModel.fromJson(String source) => LancamentoModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
