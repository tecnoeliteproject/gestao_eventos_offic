import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:gestao_eventos/core/dependences/get_it.dart';
import 'package:gestao_eventos/data/datasources/i_material_datasource.dart';
import 'package:gestao_eventos/data/datasources/i_stock_datasource.dart';
import 'package:gestao_eventos/data/datasources/local/hive/hive_material_datasource.dart';
import 'package:gestao_eventos/data/models/stock_model.dart';

class FirebaseStockDatasource implements IStockDatasource {
  FirebaseStockDatasource() {
    _firestore = getIt();
    _localMaterialDatasource = getIt<HiveMaterialDatasource>();
  }

  late final FirebaseFirestore _firestore;
  late final IMaterialDatasource _remoteMaterialDatasource;
  late final IMaterialDatasource _localMaterialDatasource;
  final String _collectionName = 'stocks';

  @override
  Future<bool> createStock(StockModel stock) async {
    var lStock = stock;

    try {
      final resultSaveMaterial =
          await _remoteMaterialDatasource.createMaterial(lStock.material!);

      if (!resultSaveMaterial) {
        return false;
      }

      lStock = lStock.copyWith(
        materialId: lStock.material!.id,
      );

      await _firestore
          .collection(_collectionName)
          .doc(lStock.id)
          .set(lStock.toMap());
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
  Future<List<StockModel>> getAllStocks() async {
    try {
      final stocks = await _firestore.collection(_collectionName).get().then(
            (value) => value.docs
                .map(
                  (e) => StockModel.fromMap(e.data()),
                )
                .toList(),
          );

      return stocks;
    } catch (e) {
      return Future.error(e);
    }
  }

  @override
  Future<StockModel?> getStock(String id) async {
    try {
      final stock = _firestore
          .collection(_collectionName)
          .doc(id)
          .get()
          .then((doc) async {
        final stock = StockModel.fromMap(doc.data()!);

        return _prepareMaterial(stock);
      });

      return stock;
    } catch (e) {
      return null;
    }
  }

  Future<StockModel> _prepareMaterial(StockModel stock) async {
    var lStock = stock;
    final material =
        await _localMaterialDatasource.getMaterial(lStock.materialId);

    if (material != null) {
      lStock = lStock.copyWith(material: material);
    } else {
      final material =
          await _remoteMaterialDatasource.getMaterial(lStock.materialId);
      if (material != null) {
        lStock = lStock.copyWith(material: material);
      }
    }

    return lStock;
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
