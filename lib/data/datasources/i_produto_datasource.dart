// ignore_for_file: one_member_abstracts

import 'package:gestao_eventos/data/models/produto_model.dart';

abstract class IProdutoDataSource {
  Future<List<ProdutoModel>> getProdutos();
  Future<ProdutoModel?> getProduto(int id);
  Future<bool> createProduto(ProdutoModel produto);
  Future<ProdutoModel> updateProduto(ProdutoModel produto);
  Future<bool> deleteProduto(ProdutoModel produto);
}
