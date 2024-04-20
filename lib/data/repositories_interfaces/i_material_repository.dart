import 'package:gestao_eventos/domain/entities/material_item.dart';

abstract class IMaterialRepository {
  Future<List<MaterialItem>> getMaterials();
  Future<MaterialItem?> getMaterial(String id);
  Future<bool> createMaterial(MaterialItem material);
  Future<bool> updateMaterial(MaterialItem material);
  Future<bool> deleteMaterial(MaterialItem material);
}
