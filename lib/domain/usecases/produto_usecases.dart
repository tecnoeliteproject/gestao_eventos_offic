import 'package:gestao_eventos/domain/entities/produto.dart';
import 'package:gestao_eventos/domain/repositories/i_produto_repository.dart';
import 'package:gestao_eventos/domain/usecases_interfaces/i_produto_usecase.dart';

class ProdutoUseCases implements IProdutoUseCases {
  ProdutoUseCases(this._produtoRepository);

  final IProdutoRepository _produtoRepository;

  @override
  Future<List<Produto>> getProdutos() {
    return _produtoRepository.getProdutos();
  }

  @override
  Future<Produto> getProduto(int id) {
    return _produtoRepository.getProduto(id);
  }

  @override
  Future<bool> createProduto(Produto produto) {
    return _produtoRepository.createProduto(produto);
  }

  @override
  Future<Produto> updateProduto(Produto produto) {
    return _produtoRepository.updateProduto(produto);
  }

  @override
  Future<bool> deleteProduto(Produto produto) {
    return _produtoRepository.deleteProduto(produto);
  }
}
