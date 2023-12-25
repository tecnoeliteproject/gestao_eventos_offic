// ignore_for_file: overridden_fields, annotate_overrides

import 'package:gestao_eventos/data/models/categoria_model.dart';
import 'package:gestao_eventos/data/models/evento_item_model.dart';
import 'package:gestao_eventos/domain/entities/categoria.dart';
import 'package:gestao_eventos/domain/entities/evento.dart';

class EventoModel extends Evento {
  EventoModel({
    required super.id,
    required super.nome,
    required super.descricao,
    required super.imagemUrl,
    required this.categoria,
    required this.itens,
  }) : super(
          categoria: categoria,
          itens: itens,
        );

  factory EventoModel.fromEntity(Evento entity) {
    return EventoModel(
      id: entity.id,
      nome: entity.nome,
      descricao: entity.descricao,
      imagemUrl: entity.imagemUrl,
      categoria: CategoriaModel.fromEntity(entity.categoria),
      itens: entity.itens.map(EventoItemModel.fromEntity).toList(),
    );
  }

  factory EventoModel.fromMap(Map<String, dynamic> map) {
    return EventoModel(
      id: map['id'] as String,
      nome: map['nome'] as String,
      descricao: map['descricao'] as String,
      imagemUrl: map['imagemUrl'] as String,
      categoria: CategoriaModel.fromMap(
        map['categoria'] as Map<String, dynamic>,
      ),
      itens: (map['itens'] as List<Map<String, dynamic>>)
          .map(EventoItemModel.fromMap)
          .toList(),
    );
  }

  final Categoria categoria;
  final List<EventoItemModel> itens;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'descricao': descricao,
      'imagemUrl': imagemUrl,
      'categoriaId': categoria.id,
      'itens': itens.map((e) => e.toMap()).toList(),
    };
  }
}
