// ignore_for_file: public_member_api_docs, sort_constructors_first, overridden_fields, avoid_equals_and_hash_code_on_mutable_classes, lines_longer_than_80_chars
import 'dart:convert';

import 'package:gestao_eventos/domain/entities/ciclo_de_vida.dart';

class CicloDeVidaModel extends CicloDeVida {
  @override
  final DateTime? dataDeLancamento;
  @override
  final DateTime? dataDeDescontinuacao;
  @override
  final String? motivoDaDescontinuacao;

  CicloDeVidaModel({
    this.dataDeLancamento,
    this.dataDeDescontinuacao,
    this.motivoDaDescontinuacao,
  }) : super(
          dataDeLancamento: dataDeLancamento,
          dataDeDescontinuacao: dataDeDescontinuacao,
          motivoDaDescontinuacao: motivoDaDescontinuacao,
        );

  factory CicloDeVidaModel.fromEntity(CicloDeVida entity) {
    return CicloDeVidaModel(
      dataDeLancamento: entity.dataDeLancamento,
      dataDeDescontinuacao: entity.dataDeDescontinuacao,
      motivoDaDescontinuacao: entity.motivoDaDescontinuacao,
    );
  }

  CicloDeVida toEntity() {
    return CicloDeVida(
      dataDeLancamento: dataDeLancamento,
      dataDeDescontinuacao: dataDeDescontinuacao,
      motivoDaDescontinuacao: motivoDaDescontinuacao,
    );
  }

  CicloDeVidaModel copyWith({
    DateTime? dataDeLancamento,
    DateTime? dataDeDescontinuacao,
    String? motivoDaDescontinuacao,
  }) {
    return CicloDeVidaModel(
      dataDeLancamento: dataDeLancamento ?? this.dataDeLancamento,
      dataDeDescontinuacao: dataDeDescontinuacao ?? this.dataDeDescontinuacao,
      motivoDaDescontinuacao:
          motivoDaDescontinuacao ?? this.motivoDaDescontinuacao,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'dataDeLancamento': dataDeLancamento?.millisecondsSinceEpoch,
      'dataDeDescontinuacao': dataDeDescontinuacao?.millisecondsSinceEpoch,
      'motivoDaDescontinuacao': motivoDaDescontinuacao,
    };
  }

  factory CicloDeVidaModel.fromMap(Map<String, dynamic> map) {
    return CicloDeVidaModel(
      dataDeLancamento:
          DateTime.fromMillisecondsSinceEpoch(map['dataDeLancamento'] as int),
      dataDeDescontinuacao: map['dataDeDescontinuacao'] != null
          ? DateTime.fromMillisecondsSinceEpoch(
              map['dataDeDescontinuacao'] as int,
            )
          : null,
      motivoDaDescontinuacao: map['motivoDaDescontinuacao'] != null
          ? map['motivoDaDescontinuacao'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CicloDeVidaModel.fromJson(String source) =>
      CicloDeVidaModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'CicloDeVidaModel(dataDeLancamento: $dataDeLancamento, dataDeDescontinuacao: $dataDeDescontinuacao, motivoDaDescontinuacao: $motivoDaDescontinuacao)';

  @override
  bool operator ==(covariant CicloDeVidaModel other) {
    if (identical(this, other)) return true;

    return other.dataDeLancamento == dataDeLancamento &&
        other.dataDeDescontinuacao == dataDeDescontinuacao &&
        other.motivoDaDescontinuacao == motivoDaDescontinuacao;
  }

  @override
  int get hashCode =>
      dataDeLancamento.hashCode ^
      dataDeDescontinuacao.hashCode ^
      motivoDaDescontinuacao.hashCode;
}
