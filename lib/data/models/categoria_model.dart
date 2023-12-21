// ignore_for_file: public_member_api_docs, sort_constructors_first,, lines_longer_than_80_chars
// ignore_for_file: overridden_fields, avoid_equals_and_hash_code_on_mutable_classes
import 'dart:convert';

import 'package:gestao_eventos/domain/entities/categoria.dart';

class CategoriaModel extends Categoria {
  CategoriaModel({
    required this.id,
    required this.nome,
    required this.descricao,
  }) : super(
          id: id,
          nome: nome,
          descricao: descricao,
        );

  @override
  final int id;
  @override
  final String nome;
  @override
  final String descricao;

  factory CategoriaModel.fromEntity(Categoria entity) {
    return CategoriaModel(
      id: entity.id,
      nome: entity.nome,
      descricao: entity.descricao,
    );
  }

  Categoria toEntity() {
    return Categoria(
      id: id,
      nome: nome,
      descricao: descricao,
    );
  }

  CategoriaModel copyWith({
    int? id,
    String? nome,
    String? descricao,
  }) {
    return CategoriaModel(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      descricao: descricao ?? this.descricao,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nome': nome,
      'descricao': descricao,
    };
  }

  factory CategoriaModel.fromMap(Map<String, dynamic> map) {
    return CategoriaModel(
      id: map['id'] as int,
      nome: map['nome'] as String,
      descricao: map['descricao'] as String,
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
