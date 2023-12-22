import 'package:gestao_eventos/domain/entities/produto.dart';

abstract class IProdutoRepository {
  Future<List<Produto>> getProdutos();
  Future<Produto?> getProduto(int id);
  Future<bool> createProduto(Produto produto);
  Future<Produto> updateProduto(Produto produto);
  Future<bool> deleteProduto(Produto produto);
}
