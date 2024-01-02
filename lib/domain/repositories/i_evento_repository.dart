import 'package:gestao_eventos/domain/entities/evento.dart';

abstract class IEventoRepository {
  Future<List<Evento>> getEventos();
  Future<Evento?> getEvento(String id);
  Future<bool> createEvento(Evento evento);
  Future<Evento> updateEvento(Evento evento);
  Future<bool> deleteEvento(Evento evento);
}
