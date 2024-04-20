import 'package:gestao_eventos/data/datasources/i_material_datasource.dart';
import 'package:gestao_eventos/data/models/material_model.dart';
import 'package:gestao_eventos/data/repositories_interfaces/i_material_repository.dart';
import 'package:gestao_eventos/domain/entities/material_item.dart';

class MaterialRepository implements IMaterialRepository {
  MaterialRepository(this._materialDatasource);

  final IMaterialDatasource _materialDatasource;

  @override
  Future<bool> createMaterial(MaterialItem material) {
    return _materialDatasource
        .createMaterial(MaterialItemModel.fromEntity(material));
  }

  @override
  Future<bool> deleteMaterial(MaterialItem material) {
    return _materialDatasource
        .deleteMaterial(MaterialItemModel.fromEntity(material));
  }

  @override
  Future<MaterialItem?> getMaterial(String id) {
    return _materialDatasource.getMaterial(id);
  }

  @override
  Future<List<MaterialItem>> getMaterials() {
    return _materialDatasource.getAllMaterials();
  }

  @override
  Future<bool> updateMaterial(MaterialItem material) {
    // TODO: implement updateMaterial
    throw UnimplementedError();
  }
}
