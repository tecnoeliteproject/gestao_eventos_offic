// ignore_for_file: public_member_api_docs, sort_constructors_first, overridden_fields, annotate_overrides
import 'dart:convert';

import 'package:gestao_eventos/domain/entities/material_item.dart';

class MaterialItemModel extends MaterialItem {
  MaterialItemModel({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.quantidade,
    required this.precoUnitario,
  }) : super(
          id: id,
          nome: nome,
          descricao: descricao,
          quantidade: quantidade,
          precoUnitario: precoUnitario,
        );

  final String id;
  final String nome;
  final String descricao;
  final int quantidade;
  final double precoUnitario;

  // from entity

  factory MaterialItemModel.fromEntity(MaterialItem material) {
    return MaterialItemModel(
      id: material.id,
      nome: material.nome,
      descricao: material.descricao,
      quantidade: material.quantidade,
      precoUnitario: material.precoUnitario,
    );
  }

  // to entity
  MaterialItem toEntity() {
    return MaterialItem(
      id: id,
      nome: nome,
      descricao: descricao,
      quantidade: quantidade,
      precoUnitario: precoUnitario,
    );
  }

  MaterialItemModel copyWith({
    String? id,
    String? nome,
    String? descricao,
    int? quantidade,
    double? precoUnitario,
  }) {
    return MaterialItemModel(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      descricao: descricao ?? this.descricao,
      quantidade: quantidade ?? this.quantidade,
      precoUnitario: precoUnitario ?? this.precoUnitario,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nome': nome,
      'descricao': descricao,
      'quantidade': quantidade,
      'precoUnitario': precoUnitario,
    };
  }

  factory MaterialItemModel.fromMap(Map<String, dynamic> map) {
    return MaterialItemModel(
      id: map['id'] as String,
      nome: map['nome'] as String,
      descricao: map['descricao'] as String,
      quantidade: map['quantidade'] as int,
      precoUnitario: map['precoUnitario'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory MaterialItemModel.fromJson(String source) =>
      MaterialItemModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MaterialModel(id: $id, nome: $nome, descricao: $descricao, quantidade: $quantidade, precoUnitario: $precoUnitario)';
  }

  @override
  bool operator ==(covariant MaterialItemModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.nome == nome &&
        other.descricao == descricao &&
        other.quantidade == quantidade &&
        other.precoUnitario == precoUnitario;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        nome.hashCode ^
        descricao.hashCode ^
        quantidade.hashCode ^
        precoUnitario.hashCode;
  }
}
