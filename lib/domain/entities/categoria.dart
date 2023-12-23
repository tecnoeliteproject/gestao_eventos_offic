import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Categoria {
  Categoria({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.color,
    required this.icon,
  });

  final String id;
  final String nome;
  final String descricao;
  final int color;
  final IconData icon;
}
