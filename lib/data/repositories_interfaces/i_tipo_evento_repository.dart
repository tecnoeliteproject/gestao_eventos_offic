import 'package:gestao_eventos/domain/entities/tipo_evento.dart';

abstract class ITipoEventoRepository {
  Future<List<TipoEvento>> getTipoEventos();
  Future<TipoEvento?> getTipoEvento(String id);
  Future<bool> createTipoEvento(TipoEvento tipoEvento);
  Future<TipoEvento?> updateTipoEvento(TipoEvento tipoEvento);
  Future<bool> deleteTipoEvento(TipoEvento tipoEvento);
}