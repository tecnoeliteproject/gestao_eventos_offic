// ignore_for_file: public_member_api_docs, sort_constructors_first, lines_longer_than_80_chars, avoid_equals_and_hash_code_on_mutable_classes
// ignore_for_file: overridden_fields

import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:gestao_eventos/domain/entities/tipo_evento.dart';

class TipoEventoModel extends TipoEvento {
  TipoEventoModel({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.exemplos,
  }) : super(
          id: id,
          name: name,
          image: image,
          description: description,
          exemplos: exemplos,
        );

  @override
  final String id;
  @override
  final String name;
  @override
  final String image;
  @override
  final String description;
  @override
  final List<String> exemplos;

  TipoEventoModel copyWith({
    String? id,
    String? name,
    String? image,
    String? description,
    List<String>? exemplos,
  }) {
    return TipoEventoModel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      description: description ?? this.description,
      exemplos: exemplos ?? this.exemplos,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
      'description': description,
      'exemplos': exemplos,
    };
  }

  factory TipoEventoModel.fromMap(Map<String, dynamic> map) {
    return TipoEventoModel(
      id: map['id'] as String,
      name: map['name'] as String,
      image: map['image'] as String,
      description: map['description'] as String,
      exemplos: List<String>.from(
        map['exemplos'] as List<String>,
      ),
    );
  }

  factory TipoEventoModel.fromEntity(TipoEvento entity) {
    return TipoEventoModel(
      id: entity.id,
      name: entity.name,
      image: entity.image,
      description: entity.description,
      exemplos: entity.exemplos,
    );
  }

  String toJson() => json.encode(toMap());

  factory TipoEventoModel.fromJson(String source) =>
      TipoEventoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TipoEventoModel(id: $id, name: $name, image: $image, description: $description, exemplos: $exemplos)';
  }

  @override
  bool operator ==(covariant TipoEventoModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.image == image &&
        other.description == description &&
        listEquals(other.exemplos, exemplos);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        image.hashCode ^
        description.hashCode ^
        exemplos.hashCode;
  }
}
