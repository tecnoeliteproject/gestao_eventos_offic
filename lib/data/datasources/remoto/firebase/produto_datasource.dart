import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gestao_eventos/data/datasources/i_produto_datasource.dart';
import 'package:gestao_eventos/data/models/produto_model.dart';

class FirebaseProdutoDataSource implements IProdutoDataSource {
  FirebaseProdutoDataSource({required FirebaseFirestore firestore})
      : _firestore = firestore;

  final FirebaseFirestore _firestore;
  final String _collectionName = 'produtos';

  @override
  Future<bool> createProduto(ProdutoModel produto) async {
    try {
      await _firestore
          .collection(_collectionName)
          .doc(produto.id.toString())
          .set(produto.toMap());

      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> deleteProduto(ProdutoModel produto) {
    // TODO: implement deleteProduto
    throw UnimplementedError();
  }

  @override
  Future<ProdutoModel?> getProduto(int id) {
    return _firestore
        .collection(_collectionName)
        .doc(id.toString())
        .get()
        .then((value) {
      return ProdutoModel.fromMap(value.data()!);
    });
  }

  @override
  Future<List<ProdutoModel>> getProdutos() {
    // TODO: implement getProdutos
    throw UnimplementedError();
  }

  @override
  Future<ProdutoModel> updateProduto(ProdutoModel produto) {
    // TODO: implement updateProduto
    throw UnimplementedError();
  }
}
