import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Categoria {
  Categoria({
    required this.id,
    required this.nome,
    required this.descricao,
    Color? color,
    this.icon,
  }) : color = color?.value;

  final int id;
  final String nome;
  final String descricao;
  final int? color;
  final IconData? icon;
}
