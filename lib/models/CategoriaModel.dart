// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/cupertino.dart';

class CategoriaModel {
  int id;
  String nome;
  String? slug;
  Color? cor;
  CategoriaModel({
    required this.id,
    required this.nome,
    this.slug,
    this.cor,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nome': nome,
      'slug': slug,
      'cor': cor?.value,
    };
  }

  factory CategoriaModel.fromMap(Map<String, dynamic> map) {
    return CategoriaModel(
      id: map['id'] as int,
      nome: map['nome'] as String,
      slug: map['slug'] != null ? map['slug'] as String : null,
      cor: map['cor'] != null ? Color(map['cor'] as int) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoriaModel.fromJson(String source) => CategoriaModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
