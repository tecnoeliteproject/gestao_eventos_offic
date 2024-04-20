import 'package:gestao_eventos/data/datasources/i_material_datasource.dart';
import 'package:gestao_eventos/data/models/material_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveMaterialDatasource implements IMaterialDatasource {
  final String _collectionNameBox = 'materiais';
  late Box<Map<dynamic, dynamic>> _collection;

  Future<void> init() async {
    if (!Hive.isBoxOpen(_collectionNameBox)) {
      _collection =
          await Hive.openBox<Map<dynamic, dynamic>>(_collectionNameBox);
    } else {
      _collection = Hive.box<Map<dynamic, dynamic>>(_collectionNameBox);
    }
  }

  Future<void> close() {
    return _collection.close();
  }

  @override
  Future<bool> createMaterial(MaterialItemModel stock) async {
    await init();

    try {
      await _collection.put(stock.id, stock.toMap());

      return true;
    } catch (e) {
      return false;
    } finally {
      await close();
    }
  }

  @override
  Future<bool> deleteMaterial(MaterialItemModel stock) async {
    await init();

    try {
      await _collection.delete(stock.id);

      return true;
    } catch (e) {
      return false;
    } finally {
      await close();
    }
  }

  @override
  Future<List<MaterialItemModel>> getAllMaterials() async {
    await init();

    try {
      final data = _collection.toMap();

      return data.values
          .map((e) => MaterialItemModel.fromMap(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      return [];
    } finally {
      await close();
    }
  }

  @override
  Future<MaterialItemModel?> getMaterial(String id) async {
    await init();

    try {
      final data = _collection.get(id);

      if (data == null) {
        return null;
      }

      return MaterialItemModel.fromMap(data as Map<String, dynamic>);
    } catch (e) {
      return null;
    } finally {
      await close();
    }
  }

  @override
  Future<bool> updateMaterial(MaterialItemModel stock) async {
    await init();

    try {
      await _collection.put(stock.id, stock.toMap());

      return true;
    } catch (e) {
      return false;
    } finally {
      await close();
    }
  }
}
