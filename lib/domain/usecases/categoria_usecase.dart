import 'package:gestao_eventos/domain/entities/categoria.dart';
import 'package:gestao_eventos/domain/repositories/i_categoria_repository.dart';
import 'package:gestao_eventos/domain/usecases_interfaces/i_categoria_usecase.dart';

class CategoriaUseCase extends ICategoriaUseCases {
  CategoriaUseCase(this._repository);

  final ICategoriaRepository _repository;

  @override
  Future<bool> createCategoria(Categoria categoria) {
    return _repository.createCategoria(categoria);
  }

  @override
  Future<bool> deleteCategoria(Categoria categoria) {
    return _repository.deleteCategoria(categoria);
  }

  @override
  Future<Categoria?> getCategoria(String id) {
    return _repository.getCategoria(id);
  }

  @override
  Future<List<Categoria>> getCategorias() {
    return _repository.getCategorias();
  }

  @override
  Future<Categoria> updateCategoria(Categoria categoria) {
    return _repository.updateCategoria(categoria);
  }
}
