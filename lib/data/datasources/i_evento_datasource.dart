<<<<<<< HEAD
// ignore_for_file: one_member_abstracts

import 'package:gestao_eventos/data/models/evento_model.dart';

abstract class IEventoDataSource {
  Future<List<EventoModel>> getEventos();
  Future<EventoModel?> getEvento(String id);
  Future<bool> createEvento(EventoModel evento);
  Future<EventoModel> updateEvento(EventoModel evento);
  Future<bool> deleteEvento(EventoModel evento);
}
=======
// ignore_for_file: one_member_abstracts

import 'package:gestao_eventos/data/models/evento_model.dart';

abstract class IEventoDataSource {
  Future<List<EventoModel>> getEventos();
  Future<EventoModel?> getEvento(String id);
  Future<bool> createEvento(EventoModel evento);
  Future<EventoModel> updateEvento(EventoModel evento);
  Future<bool> deleteEvento(EventoModel evento);
}
>>>>>>> 9c1fb90644301fea5aadcc0ac7058a394f50e020
