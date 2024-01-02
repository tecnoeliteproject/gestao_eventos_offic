import 'package:gestao_eventos/domain/entities/evento.dart';
import 'package:gestao_eventos/domain/repositories/i_evento_repository.dart';
import 'package:gestao_eventos/domain/usecases_interfaces/i_evento_usecase.dart';

class EventoUseCase extends IEventoUseCases {
  EventoUseCase(this._repository);

  final IEventoRepository _repository;

  @override
  Future<bool> createEvento(Evento evento) {
    return _repository.createEvento(evento);
  }

  @override
  Future<bool> deleteEvento(Evento evento) {
    return _repository.deleteEvento(evento);
  }

  @override
  Future<Evento?> getEvento(String id) {
    return _repository.getEvento(id);
  }

  @override
  Future<List<Evento>> getEventos() {
    return _repository.getEventos();
  }

  @override
  Future<Evento> updateEvento(Evento evento) {
    return _repository.updateEvento(evento);
  }
}
