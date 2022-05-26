// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

class BancosModel {
  int id;
  String nome;
  String? saldo;
  List cor;
  String? credito_limite;
  String? credito_disponivel;
  String? fechamento_fatura;
  String? vencimento_fatura;
  DateTime? criado_em;
  DateTime? ultima_alteracao;
  int usuario_fk;
  
  BancosModel({
    required this.id,
    required this.nome,
    this.saldo,
    required this.cor,
    this.credito_limite,
    this.credito_disponivel,
    this.fechamento_fatura,
    this.vencimento_fatura,
    this.criado_em,
    this.ultima_alteracao,
    required this.usuario_fk,
  });
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nome': nome,
      'saldo': saldo,
      'cor': cor,
      'credito_limite': credito_limite,
      'credito_disponivel': credito_disponivel,
      'fechamento_fatura': fechamento_fatura,
      'vencimento_fatura': vencimento_fatura,
      'criado_em': criado_em?.millisecondsSinceEpoch,
      'ultima_alteracao': ultima_alteracao?.millisecondsSinceEpoch,
      'usuario_fk': usuario_fk,
    };
  }

  factory BancosModel.fromMap(Map<String, dynamic> map) {
    return BancosModel(
      id: map['id'] as int,
      nome: map['nome'] as String,
      saldo: map['saldo'] != null ? map['saldo'] as String : null,
      cor: map['cor'] as List,
      credito_limite: map['credito_limite'] != null ? map['credito_limite'] as String : null,
      credito_disponivel: map['credito_disponivel'] != null ? map['credito_disponivel'] as String : null,
      fechamento_fatura: map['fechamento_fatura'] != null ? map['fechamento_fatura'] as String : null,
      vencimento_fatura: map['vencimento_fatura'] != null ? map['vencimento_fatura'] as String : null,
      criado_em: map['criado_em'] != null ? DateTime.parse(map['criado_em']) : null,
      ultima_alteracao: map['ultima_alteracao'] != null ? DateTime.parse(map['ultima_alteracao']): null,
      usuario_fk: map['usuario_fk'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory BancosModel.fromJson(String source) => BancosModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
