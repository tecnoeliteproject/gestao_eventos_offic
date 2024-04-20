import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gestao_eventos/core/dependences/get_it.dart';
import 'package:gestao_eventos/data/datasources/i_material_datasource.dart';
import 'package:gestao_eventos/data/models/material_model.dart';

class FirebaseMaterialDatasource implements IMaterialDatasource {
  FirebaseMaterialDatasource() {
    _firestore = getIt();
  }

  late final FirebaseFirestore _firestore;
  final String _collectionName = 'materiais';

  @override
  Future<bool> createMaterial(MaterialItemModel stock) async {
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
  Future<bool> deleteMaterial(MaterialItemModel stock) async {
    try {
      await _firestore.collection(_collectionName).doc(stock.id).delete();
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<List<MaterialItemModel>> getAllMaterials() async {
    try {
      final materiais = _firestore.collection(_collectionName).get().then(
            (value) => value.docs
                .map((e) => MaterialItemModel.fromMap(e.data()))
                .toList(),
          );
      return materiais;
    } catch (e) {
      return Future.error(e);
    }
  }

  @override
  Future<MaterialItemModel?> getMaterial(String id) async {
    try {
      final material = await _firestore
          .collection(_collectionName)
          .doc(id)
          .get()
          .then((doc) => MaterialItemModel.fromMap(doc.data()!));

      return material;
    } catch (e) {
      return Future.error(e);
    }
  }

  @override
  Future<bool> updateMaterial(MaterialItemModel stock) async {
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
