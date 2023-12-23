import 'package:gestao_eventos/domain/entities/categoria.dart';
import 'package:gestao_eventos/domain/entities/evento_item.dart';

class Evento {
  Evento({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.imagemUrl,
    required this.categoria,
    required this.itens,
  });

  final String id;
  final String nome;
  final String descricao;
  final String imagemUrl;
  final Categoria categoria;
  final List<EventoItem> itens;
}
