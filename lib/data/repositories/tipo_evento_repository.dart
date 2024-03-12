import 'package:gestao_eventos/data/datasources/i_tipo_evento_datasource.dart';
import 'package:gestao_eventos/data/models/tipo_evento_model.dart';
import 'package:gestao_eventos/data/repositories_interfaces/i_tipo_evento_repository.dart';
import 'package:gestao_eventos/domain/entities/tipo_evento.dart';

class TipoEventoRepository implements ITipoEventoRepository {
  TipoEventoRepository(this._datasource);

  final ITipoEventoDataSource _datasource;

  @override
  Future<bool> createTipoEvento(TipoEvento tipoEvento) {
    return _datasource.createTipoEvento(
      TipoEventoModel.fromEntity(tipoEvento),
    );
  }

  @override
  Future<bool> deleteTipoEvento(TipoEvento tipoEvento) {
    return _datasource.deleteTipoEvento(
      TipoEventoModel.fromEntity(tipoEvento),
    );
  }

  @override
  Future<TipoEvento?> getTipoEvento(String id) {
    return _datasource.getTipoEvento(id);
  }

  @override
  Future<List<TipoEvento>> getTipoEventos() {
    return _datasource.getTipoEventos();
  }

  @override
  Future<TipoEvento?> updateTipoEvento(TipoEvento tipoEvento) async {
    final result = await _datasource.updateTipoEvento(
      TipoEventoModel.fromEntity(tipoEvento),
    );

    return result?.toEntity();
  }

  @override
  Future<bool> arquivarTipoEvento(TipoEvento tipoEvento) {
    return _datasource.arquivarTipoEvento(
      TipoEventoModel.fromEntity(tipoEvento),
    );
  }

  @override
  Future<bool> desarquivarTipoEvento(TipoEvento tipoEvento) {
    return _datasource.desarquivarTipoEvento(
      TipoEventoModel.fromEntity(tipoEvento),
    );
  }

  @override
  Future<List<TipoEvento>> getArchivedTipoEventos() {
    return _datasource.getArchivedTipoEventos();
  }
}
