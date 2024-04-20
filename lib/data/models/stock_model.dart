// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: overridden_fields, annotate_overrides

import 'dart:convert';

import 'package:gestao_eventos/data/models/material_model.dart';
import 'package:gestao_eventos/domain/entities/stock.dart';

class StockModel extends Stock {
  StockModel(
    this.id,
    this.materialId,
    this.operacao,
    this.data,
    this.motivo,
    this.material,
    this.obs,
    this.localizacao,
    this.usuarioResponsavelId,
    this.clienteId,
    this.condicao,
    this.fotoUrl,
  ) : super(
          id: id,
          materialId: materialId,
          operacao: operacao,
          data: data,
          motivo: motivo,
          obs: obs,
          localizacao: localizacao,
          usuarioResponsavelId: usuarioResponsavelId,
          clienteId: clienteId,
          condicao: condicao,
          fotoUrl: fotoUrl,
        );

  final String id; // Identificador único do registo
  final String materialId; // ID do materialId associado
  final MaterialItemModel? material; // ID do materialId associado
  final String operacao; // Tipo de operação (entrada ou saída)
  final DateTime data; // Data da operação
  final String? motivo; // Motivo específico da operação (opcional)
  final String? obs; // Descrição detalhada do materialId
  final String? localizacao; // Local onde o materialId está armazenado
  final String? usuarioResponsavelId; // Pessoa responsável pela operação
  final String? clienteId; // Pessoa responsável pela operação
  final String? condicao; // Estado do materialId
  final String? fotoUrl;

  // fromEntity
  factory StockModel.fromEntity(Stock stock) {
    return StockModel(
      stock.id,
      stock.materialId,
      stock.operacao,
      stock.data,
      stock.motivo,
      stock.material == null
          ? null
          : MaterialItemModel.fromEntity(stock.material!),
      stock.obs,
      stock.localizacao,
      stock.usuarioResponsavelId,
      stock.clienteId,
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
      data: data,
      motivo: motivo,
      material: material?.toEntity(),
      obs: obs,
      localizacao: localizacao,
      usuarioResponsavelId: usuarioResponsavelId,
      clienteId: clienteId,
      condicao: condicao,
      fotoUrl: fotoUrl,
    );
  }

  StockModel copyWith({
    String? id,
    String? materialId,
    String? operacao,
    DateTime? data,
    String? motivo,
    MaterialItemModel? material,
    String? obs,
    String? localizacao,
    String? usuarioResponsavelId,
    String? clienteId,
    String? condicao,
    String? fotoUrl,
  }) {
    return StockModel(
      id ?? this.id,
      materialId ?? this.materialId,
      operacao ?? this.operacao,
      data ?? this.data,
      motivo ?? this.motivo,
      material ?? this.material,
      obs ?? this.obs,
      localizacao ?? this.localizacao,
      usuarioResponsavelId ?? this.usuarioResponsavelId,
      clienteId ?? this.clienteId,
      condicao ?? this.condicao,
      fotoUrl ?? this.fotoUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'materialId': materialId,
      'operacao': operacao,
      'data': data.millisecondsSinceEpoch,
      'motivo': motivo,
      'material': material,
      'obs': obs,
      'localizacao': localizacao,
      'usuarioResponsavel': usuarioResponsavelId,
      'clienteId': clienteId,
      'condicao': condicao,
      'fotoUrl': fotoUrl,
    };
  }

  factory StockModel.fromMap(Map<String, dynamic> map) {
    return StockModel(
      map['id'] as String,
      map['materialId'] as String,
      map['operacao'] as String,
      DateTime.fromMillisecondsSinceEpoch(map['data'] as int),
      map['motivo'] != null ? map['motivo'] as String : null,
      map['material'] != null
          ? MaterialItemModel.fromMap(map['material'] as Map<String, dynamic>)
          : null,
      map['obs'] != null ? map['obs'] as String : null,
      map['localizacao'] != null ? map['localizacao'] as String : null,
      map['usuarioResponsavel'] != null
          ? map['usuarioResponsavel'] as String
          : null,
      map['clienteId'] != null ? map['clienteId'] as String : null,
      map['condicao'] != null ? map['condicao'] as String : null,
      map['fotoUrl'] != null ? map['fotoUrl'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory StockModel.fromJson(String source) =>
      StockModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'StockModel(id: $id, materialId: $materialId, operacao: $operacao, data: $data, motivo: $motivo, obs: $obs, localizacao: $localizacao, usuarioResponsavel: $usuarioResponsavelId, condicao: $condicao, fotoUrl: $fotoUrl)';
  }

  @override
  bool operator ==(covariant StockModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.materialId == materialId &&
        other.operacao == operacao &&
        other.data == data &&
        other.motivo == motivo &&
        other.material == material &&
        other.obs == obs &&
        other.localizacao == localizacao &&
        other.usuarioResponsavelId == usuarioResponsavelId &&
        other.clienteId == clienteId &&
        other.condicao == condicao &&
        other.fotoUrl == fotoUrl;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        materialId.hashCode ^
        operacao.hashCode ^
        data.hashCode ^
        motivo.hashCode ^
        material.hashCode ^
        obs.hashCode ^
        localizacao.hashCode ^
        usuarioResponsavelId.hashCode ^
        clienteId.hashCode ^
        condicao.hashCode ^
        fotoUrl.hashCode;
  }
}
