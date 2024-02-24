import 'package:gestao_eventos/data/repositories_interfaces/i_tipo_evento_repository.dart';
import 'package:gestao_eventos/domain/entities/tipo_evento.dart';
import 'package:gestao_eventos/domain/usecases_interfaces/i_tipo_evento_usecase.dart';

class TipoEventoUsecase implements ITipoEventoUseCase {
  TipoEventoUsecase(this._repository);

  final ITipoEventoRepository _repository;

  @override
  Future<bool> createTipoEvento(TipoEvento tipoEvento) {
    return _repository.createTipoEvento(tipoEvento);
  }

  @override
  Future<bool> deleteTipoEvento(TipoEvento tipoEvento) {
    return _repository.deleteTipoEvento(tipoEvento);
  }

  @override
  Future<TipoEvento?> getTipoEvento(String id) {
    return _repository.getTipoEvento(id);
  }

  @override
  Future<List<TipoEvento>> getTipoEventos() {
    return _repository.getTipoEventos();
  }

  @override
  Future<TipoEvento> updateTipoEvento(TipoEvento tipoEvento) {
    return _repository.updateTipoEvento(tipoEvento);
  }
}
