import 'package:gestao_eventos/data/datasources/i_evento_datasource.dart';
import 'package:gestao_eventos/data/models/evento_model.dart';
import 'package:gestao_eventos/domain/entities/evento.dart';
import 'package:gestao_eventos/domain/repositories/i_evento_repository.dart';

class EventoRepository extends IEventoRepository {
  EventoRepository(this._eventoDataSource);

  final IEventoDataSource _eventoDataSource;

  @override
  Future<List<Evento>> getEventos() {
    return _eventoDataSource.getEventos();
  }

  @override
  Future<Evento?> getEvento(String id) {
    return _eventoDataSource.getEvento(id);
  }

  @override
  Future<bool> createEvento(Evento evento) {
    return _eventoDataSource.createEvento(EventoModel.fromEntity(evento));
  }

  @override
  Future<Evento> updateEvento(Evento evento) {
    return _eventoDataSource.updateEvento(EventoModel.fromEntity(evento));
  }

  @override
  Future<bool> deleteEvento(Evento evento) {
    return _eventoDataSource.deleteEvento(EventoModel.fromEntity(evento));
  }
}
