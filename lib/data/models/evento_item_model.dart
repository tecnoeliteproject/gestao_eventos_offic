// ignore_for_file: overridden_fields, annotate_overrides

import 'package:gestao_eventos/domain/entities/evento_item.dart';

class EventoItemModel extends EventoItem {
  EventoItemModel({
    required this.id,
    required this.nome,
  }) : super(
          id: id,
          nome: nome,
        );

  factory EventoItemModel.fromEntity(EventoItem entity) {
    return EventoItemModel(
      id: entity.id,
      nome: entity.nome,
    );
  }

  factory EventoItemModel.toEntity(EventoItemModel model) {
    return EventoItemModel(
      id: model.id,
      nome: model.nome,
    );
  }

  factory EventoItemModel.fromMap(Map<String, dynamic> map) {
    return EventoItemModel(
      id: map['id'] as String,
      nome: map['nome'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
    };
  }

  final String id;
  final String nome;
}
