<<<<<<< HEAD
import 'package:gestao_eventos/data/models/categoria_model.dart';

abstract class ICategoriaDataSource {
  Future<List<CategoriaModel>> getCategorias();
  Future<CategoriaModel?> getCategoria(String id);
  Future<bool> createCategoria(CategoriaModel categoria);
  Future<CategoriaModel> updateCategoria(CategoriaModel categoria);
  Future<bool> deleteCategoria(CategoriaModel categoria);
}
=======
import 'package:gestao_eventos/data/models/categoria_model.dart';

abstract class ICategoriaDataSource {
  Future<List<CategoriaModel>> getCategorias();
  Future<CategoriaModel?> getCategoria(String id);
  Future<bool> createCategoria(CategoriaModel categoria);
  Future<CategoriaModel> updateCategoria(CategoriaModel categoria);
  Future<bool> deleteCategoria(CategoriaModel categoria);
}
>>>>>>> 9c1fb90644301fea5aadcc0ac7058a394f50e020
