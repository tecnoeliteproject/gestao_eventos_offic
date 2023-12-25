import 'package:gestao_eventos/data/models/categoria_model.dart';

abstract class ICategoriaDataSource {
  Future<List<CategoriaModel>> getCategorias();
  Future<CategoriaModel?> getCategoria(String id);
  Future<bool> createCategoria(CategoriaModel categoria);
  Future<CategoriaModel> updateCategoria(CategoriaModel categoria);
  Future<bool> deleteCategoria(CategoriaModel categoria);
}
