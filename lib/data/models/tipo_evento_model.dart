// ignore_for_file: public_member_api_docs, sort_constructors_first, lines_longer_than_80_chars, avoid_equals_and_hash_code_on_mutable_classes
// ignore_for_file: overridden_fields

import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:gestao_eventos/domain/entities/c_image.dart';
import 'package:gestao_eventos/domain/entities/tipo_evento.dart';

class TipoEventoModel extends TipoEvento {
  @override
  final String id;
  @override
  final String name;
  @override
  final CImage image;
  @override
  final String description;
  @override
  final bool? isArchived;
  @override
  final List<CImage> exemplos;

  TipoEventoModel({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.exemplos,
    this.isArchived,
  }) : super(
          id: id,
          name: name,
          image: image,
          description: description,
          exemplos: exemplos,
          isArchived: isArchived,
        );

  TipoEventoModel copyWith({
    String? id,
    String? name,
    CImage? image,
    String? description,
    List<CImage>? exemplos,
    bool? isArchived,
  }) {
    return TipoEventoModel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      description: description ?? this.description,
      exemplos: exemplos ?? this.exemplos,
      isArchived: isArchived ?? this.isArchived,
    );
  }

  factory TipoEventoModel.fromEntity(TipoEvento entity) {
    return TipoEventoModel(
      id: entity.id,
      name: entity.name,
      image: entity.image,
      description: entity.description,
      exemplos: entity.exemplos,
      isArchived: entity.isArchived,
    );
  }

  TipoEvento toEntity() {
    return TipoEvento(
      id: id,
      name: name,
      image: image,
      description: description,
      exemplos: exemplos,
      isArchived: isArchived,
    );
  }

  factory TipoEventoModel.fromMap(Map<String, dynamic> map) {
    return TipoEventoModel(
      id: map['id'] as String,
      name: map['name'] as String,
      image: map['image'] as CImage,
      isArchived: map['isArchived'] as bool? ?? false,
      description: map['description'] as String,
      exemplos: map['exemplos'] as List<CImage>,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image.url,
      'description': description,
      'isArchived': isArchived,
      'exemplos': exemplos.map((e) => e.url).toList(),
    };
  }

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
        other.isArchived == isArchived &&
        other.description == description &&
        listEquals(other.exemplos, exemplos);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        image.hashCode ^
        description.hashCode ^
        isArchived.hashCode ^
        exemplos.hashCode;
  }
}
