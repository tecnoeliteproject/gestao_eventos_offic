// ignore_for_file: public_member_api_docs, sort_constructors_first,
// avoid_equals_and_hash_code_on_mutable_classes
// ignore_for_file: overridden_fields, annotate_overrides

import 'dart:convert';

import 'package:gestao_eventos/data/models/categoria_model.dart';
import 'package:gestao_eventos/data/models/ciclo_de_vida_model.dart';
import 'package:gestao_eventos/data/models/estoque_model.dart';
import 'package:gestao_eventos/domain/entities/produto.dart';

class ProdutoModel extends Produto {
  ProdutoModel({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.categoria,
    required this.preco,
    required this.imagemUrl,
    required this.estoque,
    required this.cicloDeVida,
  }) : super(
          id: id,
          nome: nome,
          descricao: descricao,
          categoria: categoria,
          preco: preco,
          imagemUrl: '',
          estoque: estoque,
          cicloDeVida: cicloDeVida,
        );

  final int id;
  final String nome;
  final String descricao;
  final CategoriaModel categoria;
  final double preco;
  final String imagemUrl;
  final EstoqueModel estoque;
  final CicloDeVidaModel cicloDeVida;

  ProdutoModel copyWith({
    int? id,
    String? nome,
    String? descricao,
    CategoriaModel? categoria,
    double? preco,
    String? imagemUrl,
    EstoqueModel? estoque,
    CicloDeVidaModel? cicloDeVida,
  }) {
    return ProdutoModel(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      descricao: descricao ?? this.descricao,
      categoria: categoria ?? this.categoria,
      preco: preco ?? this.preco,
      imagemUrl: imagemUrl ?? this.imagemUrl,
      estoque: estoque ?? this.estoque,
      cicloDeVida: cicloDeVida ?? this.cicloDeVida,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nome': nome,
      'descricao': descricao,
      'categoriaId': categoria.id.toString(),
      'preco': preco,
      'imagemUrl': imagemUrl,
      'estoque': estoque.toMap(),
      'cicloDeVida': cicloDeVida.toMap(),
    };
  }

  factory ProdutoModel.fromEntity(Produto entity) {
    return ProdutoModel(
      id: entity.id,
      nome: entity.nome,
      descricao: entity.descricao,
      categoria: CategoriaModel.fromEntity(entity.categoria),
      preco: entity.preco,
      imagemUrl: entity.imagemUrl,
      estoque: EstoqueModel.fromEntity(entity.estoque),
      cicloDeVida: CicloDeVidaModel.fromEntity(entity.cicloDeVida),
    );
  }

  Produto toEntity() {
    return Produto(
      id: id,
      nome: nome,
      descricao: descricao,
      categoria: categoria.toEntity(),
      preco: preco,
      imagemUrl: imagemUrl,
      estoque: estoque.toEntity(),
      cicloDeVida: cicloDeVida.toEntity(),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProdutoModel.fromJson(String source) =>
      ProdutoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory ProdutoModel.fromMap(Map<String, dynamic> map) {
    return ProdutoModel(
      id: map['id'] as int,
      nome: map['nome'] as String,
      descricao: map['descricao'] as String,
      categoria:
          CategoriaModel.fromMap(map['categoria'] as Map<String, dynamic>),
      preco: map['preco'] as double,
      imagemUrl: map['imagemUrl'] as String,
      estoque: EstoqueModel.fromMap(map['estoque'] as Map<String, dynamic>),
      cicloDeVida:
          CicloDeVidaModel.fromMap(map['cicloDeVida'] as Map<String, dynamic>),
    );
  }

  @override
  String toString() {
    return 'ProdutoModel(id: $id, nome: $nome, descricao: $descricao, categoria: $categoria, preco: $preco, imagemUrl: $imagemUrl, estoque: $estoque, cicloDeVida: $cicloDeVida)';
  }

  @override
  bool operator ==(covariant ProdutoModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.nome == nome &&
        other.descricao == descricao &&
        other.categoria == categoria &&
        other.preco == preco &&
        other.imagemUrl == imagemUrl &&
        other.estoque == estoque &&
        other.cicloDeVida == cicloDeVida;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        nome.hashCode ^
        descricao.hashCode ^
        categoria.hashCode ^
        preco.hashCode ^
        imagemUrl.hashCode ^
        estoque.hashCode ^
        cicloDeVida.hashCode;
  }
}
