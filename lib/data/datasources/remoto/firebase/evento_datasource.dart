import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gestao_eventos/data/datasources/i_categoria_datasource.dart';
import 'package:gestao_eventos/data/datasources/i_evento_datasource.dart';
import 'package:gestao_eventos/data/models/evento_model.dart';

class FirebaseEventoDataSource implements IEventoDataSource {
  FirebaseEventoDataSource({
    required FirebaseFirestore firestore,
    required ICategoriaDataSource categoriaDataSource,
  })  : _firestore = firestore,
        _categoriaDataSource = categoriaDataSource;

  final FirebaseFirestore _firestore;
  final ICategoriaDataSource _categoriaDataSource;
  final String _collectionName = 'eventos';

  @override
  Future<bool> createEvento(EventoModel evento) async {
    try {
      await _firestore
          .collection(_collectionName)
          .doc(evento.id)
          .set(evento.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> deleteEvento(EventoModel evento) {
    // TODO: implement deleteEvento
    throw UnimplementedError();
  }

  @override
  Future<EventoModel?> getEvento(int id) async {
    try {
      final result = await _firestore
          .collection(_collectionName)
          .doc(id.toString())
          .get()
          .then((doc) async {
        final categoria = await _categoriaDataSource.getCategoria(
          doc.data()!['categoriaId'] as String,
        );

        doc.data()!['categoria'] = categoria;

        return EventoModel.fromMap(doc.data()!);
      });

      return result;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<EventoModel>> getEventos() {
    // TODO: implement getEventos
    throw UnimplementedError();
  }

  @override
  Future<EventoModel> updateEvento(EventoModel evento) {
    // TODO: implement updateEvento
    throw UnimplementedError();
  }
}
