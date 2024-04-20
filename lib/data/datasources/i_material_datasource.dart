import 'package:gestao_eventos/data/models/material_model.dart';

abstract class IMaterialDatasource {
  Future<List<MaterialItemModel>> getAllMaterials();
  Future<MaterialItemModel?> getMaterial(String id);
  Future<bool> createMaterial(MaterialItemModel stock);
  Future<bool> updateMaterial(MaterialItemModel stock);
  Future<bool> deleteMaterial(MaterialItemModel stock);
}
