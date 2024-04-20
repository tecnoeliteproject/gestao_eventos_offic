import 'package:gestao_eventos/data/repositories_interfaces/i_material_repository.dart';
import 'package:gestao_eventos/domain/entities/material_item.dart';
import 'package:gestao_eventos/domain/usecases_interfaces/i_material_usecase.dart';

class MaterialUsecase implements IMaterialUsecase {
  MaterialUsecase(this._materialRepository);

  final IMaterialRepository _materialRepository;

  @override
  Future<bool> createMaterial(MaterialItem material) {
    return _materialRepository.createMaterial(material);
  }

  @override
  Future<bool> deleteMaterial(MaterialItem material) {
    return _materialRepository.deleteMaterial(material);
  }

  @override
  Future<MaterialItem?> getMaterial(String id) {
    return _materialRepository.getMaterial(id);
  }

  @override
  Future<bool> updateMaterial(MaterialItem material) {
    return _materialRepository.updateMaterial(material);
  }

  @override
  Future<List<MaterialItem>> getAllMaterials() {
    return _materialRepository.getMaterials();
  }
}
