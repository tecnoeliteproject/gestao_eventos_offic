import 'package:gestao_eventos/domain/entities/material_item.dart';

abstract class IMaterialUsecase {
  Future<List<MaterialItem>> getAllMaterials();
  Future<MaterialItem?> getMaterial(String id);
  Future<bool> createMaterial(MaterialItem material);
  Future<bool> updateMaterial(MaterialItem material);
  Future<bool> deleteMaterial(MaterialItem material);
}
