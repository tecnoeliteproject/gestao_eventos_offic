import 'package:gestao_eventos/data/repositories_interfaces/i_tipo_evento_repository.dart';
import 'package:gestao_eventos/domain/entities/tipo_evento.dart';

class TipoEventoRepository implements ITipoEventoRepository {
  
  @override
  Future<bool> createTipoEvento(TipoEvento tipoEvento) {
    // TODO: implement createTipoEvento
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteTipoEvento(TipoEvento tipoEvento) {
    // TODO: implement deleteTipoEvento
    throw UnimplementedError();
  }

  @override
  Future<TipoEvento?> getTipoEvento(String id) {
    // TODO: implement getTipoEvento
    throw UnimplementedError();
  }

  @override
  Future<List<TipoEvento>> getTipoEventos() {
    // TODO: implement getTipoEventos
    throw UnimplementedError();
  }

  @override
  Future<TipoEvento> updateTipoEvento(TipoEvento tipoEvento) {
    // TODO: implement updateTipoEvento
    throw UnimplementedError();
  }
}
