import 'package:gestao_eventos/data/datasources/i_produto_datasource.dart';
import 'package:gestao_eventos/data/models/produto_model.dart';
import 'package:gestao_eventos/domain/entities/produto.dart';
import 'package:gestao_eventos/domain/repositories/i_produto_repository.dart';

class ProdutoRepository extends IProdutoRepository {
  ProdutoRepository(this._produtoDataSource);

  final IProdutoDataSource _produtoDataSource;

  @override
  Future<List<Produto>> getProdutos() {
    return _produtoDataSource.getProdutos();
  }

  @override
  Future<Produto?> getProduto(int id) {
    return _produtoDataSource.getProduto(id);
  }

  @override
  Future<bool> createProduto(Produto produto) {
    return _produtoDataSource.createProduto(ProdutoModel.fromEntity(produto));
  }

  @override
  Future<Produto> updateProduto(Produto produto) {
    return _produtoDataSource.updateProduto(ProdutoModel.fromEntity(produto));
  }

  @override
  Future<bool> deleteProduto(Produto produto) {
    return _produtoDataSource.deleteProduto(ProdutoModel.fromEntity(produto));
  }
}
