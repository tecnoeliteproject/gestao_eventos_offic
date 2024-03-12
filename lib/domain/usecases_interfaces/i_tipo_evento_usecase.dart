import 'package:gestao_eventos/domain/entities/tipo_evento.dart';

abstract class ITipoEventoUseCase {
  Future<List<TipoEvento>> getTipoEventos();
  Future<List<TipoEvento>> getArchivedTipoEventos();
  Future<TipoEvento?> getTipoEvento(String id);
  Future<bool> createTipoEvento(TipoEvento tipoEvento);
  Future<TipoEvento?> updateTipoEvento(TipoEvento tipoEvento);
  Future<bool> deleteTipoEvento(TipoEvento tipoEvento);
  Future<bool> arquivarTipoEvento(TipoEvento tipoEvento);
  Future<bool> desarquivarTipoEvento(TipoEvento tipoEvento);
}
