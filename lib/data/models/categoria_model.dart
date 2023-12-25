// ignore_for_file: public_member_api_docs, sort_constructors_first,, lines_longer_than_80_chars
// ignore_for_file: overridden_fields, avoid_equals_and_hash_code_on_mutable_classes
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:gestao_eventos/domain/entities/categoria.dart';

class CategoriaModel extends Categoria {
  CategoriaModel({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.color,
    required this.icon,
  }) : super(
          id: id,
          nome: nome,
          descricao: descricao,
          color: color,
          icon: icon,
        );

  @override
  final String id;
  @override
  final String nome;
  @override
  final String descricao;
  @override
  final int color;
  @override
  final IconData icon;

  factory CategoriaModel.fromEntity(Categoria entity) {
    return CategoriaModel(
      id: entity.id,
      nome: entity.nome,
      descricao: entity.descricao,
      color: entity.color,
      icon: entity.icon,
    );
  }

  Categoria toEntity() {
    return Categoria(
      id: id,
      nome: nome,
      descricao: descricao,
      color: color,
      icon: icon,
    );
  }

  CategoriaModel copyWith({
    String? id,
    String? nome,
    String? descricao,
    int? color,
    IconData? icon,
  }) {
    return CategoriaModel(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      descricao: descricao ?? this.descricao,
      color: color ?? this.color,
      icon: icon ?? this.icon,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nome': nome,
      'descricao': descricao,
      'color': color,
      'icon': icon.codePoint,
    };
  }

  factory CategoriaModel.fromMap(Map<String, dynamic> map) {
    return CategoriaModel(
      id: map['id'] as String,
      nome: map['nome'] as String,
      descricao: map['descricao'] as String,
      color: map['color'] as int,
      icon: IconData(map['icon'] as int, fontFamily: 'MaterialIcons'),
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoriaModel.fromJson(String source) =>
      CategoriaModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'CategoriaModel(id: $id, nome: $nome, descricao: $descricao)';

  @override
  bool operator ==(covariant CategoriaModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.nome == nome && other.descricao == descricao;
  }

  @override
  int get hashCode => id.hashCode ^ nome.hashCode ^ descricao.hashCode;
}
