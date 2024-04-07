import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:gestao_eventos/core/dependences/get_it.dart';
import 'package:gestao_eventos/data/datasources/i_stock_datasource.dart';
import 'package:gestao_eventos/data/models/stock_model.dart';

class FirebaseStockDatasource implements IStockDatasource {
  FirebaseStockDatasource() {
    _firestore = getIt();
    // _storage = getIt();
  }

  late final FirebaseFirestore _firestore;
  // late final FirebaseStorage _storage;
  final String _collectionName = 'stocks';
  // final String _imageStorageBucket = '/images/tipoEventos';

  @override
  Future<bool> createStock(StockModel stock) async {
    try {
      await _firestore
          .collection(_collectionName)
          .doc(stock.id)
          .set(stock.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> deleteStock(StockModel stock) async {
    try {
      await _firestore.collection(_collectionName).doc(stock.id).delete();
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<List<StockModel>> getAllStocks() {
    try {
      final stocks = _firestore.collection(_collectionName).get().then(
            (value) =>
                value.docs.map((e) => StockModel.fromMap(e.data())).toList(),
          );
      return stocks;
    } catch (e) {
      return Future.error(e);
    }
  }

  @override
  Future<StockModel?> getStock(String id) {
    try {
      final stock = _firestore
          .collection(_collectionName)
          .doc(id)
          .get()
          .then((doc) => StockModel.fromMap(doc.data()!));

      return stock;
    } catch (e) {
      return Future.error(e);
    }
  }

  @override
  Future<bool> updateStock(StockModel stock) async {
    try {
      await _firestore
          .collection(_collectionName)
          .doc(stock.id)
          .update(stock.toMap());

      return true;
    } catch (e) {
      return false;
    }
  }
}
