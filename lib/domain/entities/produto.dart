import 'package:gestao_eventos/domain/entities/categoria.dart';
import 'package:gestao_eventos/domain/entities/ciclo_de_vida.dart';
import 'package:gestao_eventos/domain/entities/estoque.dart';

class Produto {
  Produto({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.categoria,
    required this.preco,
    required this.imagemUrl,
    required this.estoque,
    required this.cicloDeVida,
  });

  int id;
  String nome;
  String descricao;
  Categoria categoria;
  double preco;
  String imagemUrl;
  Estoque estoque;
  CicloDeVida cicloDeVida;

  @override
  String toString() {
    return 'Produto(nome: $nome, descricao: $descricao, categoria: $categoria,'
        ' preco: $preco, imagemUrl: $imagemUrl, estoque: $estoque,'
        ' cicloDeVida: $cicloDeVida)';
  }
}
