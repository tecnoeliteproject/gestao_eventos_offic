<<<<<<< HEAD
import 'package:gestao_eventos/domain/entities/categoria.dart';

abstract class ICategoriaUseCases {
  Future<List<Categoria>> getCategorias();
  Future<Categoria?> getCategoria(String id);
  Future<bool> createCategoria(Categoria categoria);
  Future<Categoria> updateCategoria(Categoria categoria);
  Future<bool> deleteCategoria(Categoria categoria);
}
=======
import 'package:gestao_eventos/domain/entities/categoria.dart';

abstract class ICategoriaUseCases {
  Future<List<Categoria>> getCategorias();
  Future<Categoria?> getCategoria(String id);
  Future<bool> createCategoria(Categoria categoria);
  Future<Categoria> updateCategoria(Categoria categoria);
  Future<bool> deleteCategoria(Categoria categoria);
}
>>>>>>> 9c1fb90644301fea5aadcc0ac7058a394f50e020
