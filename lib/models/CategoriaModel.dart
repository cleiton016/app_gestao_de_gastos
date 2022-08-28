// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

import 'package:flutter/cupertino.dart';

class CategoriaModel {
  int id;
  String nome;
  String? slug;
  Color? cor;
  DateTime? criado_em;
  DateTime? ultima_alteracao;


  CategoriaModel({
    required this.id,
    required this.nome,
    this.slug,
    this.cor,
    this.criado_em,
    this.ultima_alteracao,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nome': nome,
      'slug': slug,
      'cor': cor?.value,
      'criado_em': criado_em?.millisecondsSinceEpoch,
      'ultima_alteracao': ultima_alteracao?.millisecondsSinceEpoch,
    };
  }

  factory CategoriaModel.fromMap(Map<String, dynamic> map) {
    return CategoriaModel(
      id: map['id'] as int,
      nome: map['nome'] as String,
      slug: map['slug'] != null ? map['slug'] as String : null,
      cor: map['cor'] != null ? Color(map['cor'] as int) : null,
      criado_em: map['criado_em'] != null ? DateTime.parse(map['criado_em']) : null,
      ultima_alteracao: map['ultima_alteracao'] != null ? DateTime.parse(map['ultima_alteracao']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoriaModel.fromJson(String source) => CategoriaModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
