import 'package:gestao_eventos/data/datasources/i_categoria_datasource.dart';
import 'package:gestao_eventos/data/models/categoria_model.dart';
import 'package:gestao_eventos/domain/entities/categoria.dart';
import 'package:gestao_eventos/domain/repositories/i_categoria_repository.dart';

class CategoriaRepository extends ICategoriaRepository {
  CategoriaRepository(this._categoriaDataSource);

  final ICategoriaDataSource _categoriaDataSource;

  @override
  Future<List<Categoria>> getCategorias() {
    return _categoriaDataSource.getCategorias();
  }

  @override
  Future<Categoria?> getCategoria(String id) {
    return _categoriaDataSource.getCategoria(id);
  }

  @override
  Future<bool> createCategoria(Categoria categoria) {
    return _categoriaDataSource
        .createCategoria(CategoriaModel.fromEntity(categoria));
  }

  @override
  Future<Categoria> updateCategoria(Categoria categoria) {
    return _categoriaDataSource
        .updateCategoria(CategoriaModel.fromEntity(categoria));
  }

  @override
  Future<bool> deleteCategoria(Categoria categoria) {
    return _categoriaDataSource
        .deleteCategoria(CategoriaModel.fromEntity(categoria));
  }
}
