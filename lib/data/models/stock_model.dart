// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: overridden_fields, annotate_overrides

import 'dart:convert';

import 'package:gestao_eventos/domain/entities/stock.dart';

class StockModel extends Stock {
  StockModel(
    this.id,
    this.materialId,
    this.operacao,
    this.precoUnitario,
    this.quantidade,
    this.data,
    this.motivo,
    this.descricaoMaterial,
    this.localizacao,
    this.usuarioResponsavel,
    this.condicao,
    this.fotoUrl,
  ) : super(
          id: id,
          materialId: materialId,
          operacao: operacao,
          precoUnitario: precoUnitario,
          quantidade: quantidade,
          data: data,
          motivo: motivo,
          descricaoMaterial: descricaoMaterial,
          localizacao: localizacao,
          usuarioResponsavel: usuarioResponsavel,
          condicao: condicao,
          fotoUrl: fotoUrl,
        );

  final String id; // Identificador único do registo
  final String materialId; // ID do material associado
  final String operacao; // Tipo de operação (entrada ou saída)
  final double precoUnitario; // Preço unitário ou por lote
  final int quantidade; // Quantidade movimentada
  final DateTime data; // Data da operação

  final String? motivo; // Motivo específico da operação (opcional)
  final String? descricaoMaterial; // Descrição detalhada do material
  final String? localizacao; // Local onde o material está armazenado
  final String? usuarioResponsavel; // Pessoa responsável pela operação
  final String? condicao; // Estado do material
  final String? fotoUrl;

  // fromEntity
  factory StockModel.fromEntity(Stock stock) {
    return StockModel(
      stock.id,
      stock.materialId,
      stock.operacao,
      stock.precoUnitario,
      stock.quantidade,
      stock.data,
      stock.motivo,
      stock.descricaoMaterial,
      stock.localizacao,
      stock.usuarioResponsavel,
      stock.condicao,
      stock.fotoUrl,
    );
  }

  // toEntity
  Stock toEntity() {
    return Stock(
      id: id,
      materialId: materialId,
      operacao: operacao,
      precoUnitario: precoUnitario,
      quantidade: quantidade,
      data: data,
      motivo: motivo,
      descricaoMaterial: descricaoMaterial,
      localizacao: localizacao,
      usuarioResponsavel: usuarioResponsavel,
      condicao: condicao,
      fotoUrl: fotoUrl,
    );
  }

  StockModel copyWith({
    String? id,
    String? materialId,
    String? operacao,
    double? precoUnitario,
    int? quantidade,
    DateTime? data,
    String? motivo,
    String? descricaoMaterial,
    String? localizacao,
    String? usuarioResponsavel,
    String? condicao,
    String? fotoUrl,
  }) {
    return StockModel(
      id ?? this.id,
      materialId ?? this.materialId,
      operacao ?? this.operacao,
      precoUnitario ?? this.precoUnitario,
      quantidade ?? this.quantidade,
      data ?? this.data,
      motivo ?? this.motivo,
      descricaoMaterial ?? this.descricaoMaterial,
      localizacao ?? this.localizacao,
      usuarioResponsavel ?? this.usuarioResponsavel,
      condicao ?? this.condicao,
      fotoUrl ?? this.fotoUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'materialId': materialId,
      'operacao': operacao,
      'precoUnitario': precoUnitario,
      'quantidade': quantidade,
      'data': data.millisecondsSinceEpoch,
      'motivo': motivo,
      'descricaoMaterial': descricaoMaterial,
      'localizacao': localizacao,
      'usuarioResponsavel': usuarioResponsavel,
      'condicao': condicao,
      'fotoUrl': fotoUrl,
    };
  }

  factory StockModel.fromMap(Map<String, dynamic> map) {
    return StockModel(
      map['id'] as String,
      map['materialId'] as String,
      map['operacao'] as String,
      map['precoUnitario'] as double,
      map['quantidade'] as int,
      DateTime.fromMillisecondsSinceEpoch(map['data'] as int),
      map['motivo'] != null ? map['motivo'] as String : null,
      map['descricaoMaterial'] != null
          ? map['descricaoMaterial'] as String
          : null,
      map['localizacao'] != null ? map['localizacao'] as String : null,
      map['usuarioResponsavel'] != null
          ? map['usuarioResponsavel'] as String
          : null,
      map['condicao'] != null ? map['condicao'] as String : null,
      map['fotoUrl'] != null ? map['fotoUrl'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory StockModel.fromJson(String source) =>
      StockModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'StockModel(id: $id, materialId: $materialId, operacao: $operacao, precoUnitario: $precoUnitario, quantidade: $quantidade, data: $data, motivo: $motivo, descricaoMaterial: $descricaoMaterial, localizacao: $localizacao, usuarioResponsavel: $usuarioResponsavel, condicao: $condicao, fotoUrl: $fotoUrl)';
  }

  @override
  bool operator ==(covariant StockModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.materialId == materialId &&
        other.operacao == operacao &&
        other.precoUnitario == precoUnitario &&
        other.quantidade == quantidade &&
        other.data == data &&
        other.motivo == motivo &&
        other.descricaoMaterial == descricaoMaterial &&
        other.localizacao == localizacao &&
        other.usuarioResponsavel == usuarioResponsavel &&
        other.condicao == condicao &&
        other.fotoUrl == fotoUrl;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        materialId.hashCode ^
        operacao.hashCode ^
        precoUnitario.hashCode ^
        quantidade.hashCode ^
        data.hashCode ^
        motivo.hashCode ^
        descricaoMaterial.hashCode ^
        localizacao.hashCode ^
        usuarioResponsavel.hashCode ^
        condicao.hashCode ^
        fotoUrl.hashCode;
  }
}
