<<<<<<< HEAD
import 'package:gestao_eventos/domain/entities/evento.dart';

abstract class IEventoUseCases {
  Future<List<Evento>> getEventos();
  Future<Evento?> getEvento(String id);
  Future<bool> createEvento(Evento evento);
  Future<Evento> updateEvento(Evento evento);
  Future<bool> deleteEvento(Evento evento);
}
=======
import 'package:gestao_eventos/domain/entities/evento.dart';

abstract class IEventoUseCases {
  Future<List<Evento>> getEventos();
  Future<Evento?> getEvento(String id);
  Future<bool> createEvento(Evento evento);
  Future<Evento> updateEvento(Evento evento);
  Future<bool> deleteEvento(Evento evento);
}
>>>>>>> 9c1fb90644301fea5aadcc0ac7058a394f50e020
