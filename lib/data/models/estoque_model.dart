// ignore_for_file: public_member_api_docs, sort_constructors_first, annotate_overrides, overridden_fields, avoid_equals_and_hash_code_on_mutable_classes
import 'dart:convert';

import 'package:gestao_eventos/domain/entities/estoque.dart';

class EstoqueModel extends Estoque {
  final int quantidade;
  final DateTime? dataDeEntrada;
  final DateTime? dataDeSaida;

  EstoqueModel({
    required this.quantidade,
    this.dataDeEntrada,
    this.dataDeSaida,
  }) : super(
          quantidade: quantidade,
          dataDeEntrada: dataDeEntrada,
          dataDeSaida: dataDeSaida,
        );

  factory EstoqueModel.fromEntity(Estoque entity) {
    return EstoqueModel(
      quantidade: entity.quantidade,
      dataDeEntrada: entity.dataDeEntrada,
      dataDeSaida: entity.dataDeSaida,
    );
  }

  Estoque toEntity() {
    return Estoque(
      quantidade: quantidade,
      dataDeEntrada: dataDeEntrada,
      dataDeSaida: dataDeSaida,
    );
  }

  EstoqueModel copyWith({
    int? id,
    int? quantidade,
    DateTime? dataDeEntrada,
    DateTime? dataDeSaida,
  }) {
    return EstoqueModel(
      quantidade: quantidade ?? this.quantidade,
      dataDeEntrada: dataDeEntrada ?? this.dataDeEntrada,
      dataDeSaida: dataDeSaida ?? this.dataDeSaida,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'quantidade': quantidade,
      'dataDeEntrada': dataDeEntrada?.millisecondsSinceEpoch,
      'dataDeSaida': dataDeSaida?.millisecondsSinceEpoch,
    };
  }

  factory EstoqueModel.fromMap(Map<String, dynamic> map) {
    return EstoqueModel(
      quantidade: map['quantidade'] as int,
      dataDeEntrada: map['dataDeEntrada'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['dataDeEntrada'] as int)
          : null,
      dataDeSaida: map['dataDeSaida'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['dataDeSaida'] as int)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory EstoqueModel.fromJson(String source) =>
      EstoqueModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'EstoqueModel(quantidade: $quantidade, dataDeEntrada: $dataDeEntrada, dataDeSaida: $dataDeSaida)';
  }

  @override
  bool operator ==(covariant EstoqueModel other) {
    if (identical(this, other)) return true;

    return other.quantidade == quantidade &&
        other.dataDeEntrada == dataDeEntrada &&
        other.dataDeSaida == dataDeSaida;
  }

  @override
  int get hashCode {
    return quantidade.hashCode ^ dataDeEntrada.hashCode ^ dataDeSaida.hashCode;
  }
}
