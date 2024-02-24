import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gestao_eventos/data/datasources/i_tipo_evento_datasource.dart';
import 'package:gestao_eventos/data/models/tipo_evento_model.dart';

class FirebaseTipoTipoEventoDataSource implements ITipoEventoDataSource {
  FirebaseTipoTipoEventoDataSource({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  final FirebaseFirestore _firestore;
  final String _collectionName = 'tipoEventos';

  @override
  Future<bool> createTipoEvento(TipoEventoModel tipoEvento) async {
    try {
      await _firestore
          .collection(_collectionName)
          .doc(tipoEvento.id)
          .set(tipoEvento.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> deleteTipoEvento(TipoEventoModel tipoEvento) async {
    try {
      await _firestore.collection(_collectionName).doc(tipoEvento.id).delete();
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<TipoEventoModel?> getTipoEvento(String id) async {
    try {
      final result = await _firestore
          .collection(_collectionName)
          .doc(id)
          .get()
          .then((doc) async {
        return TipoEventoModel.fromMap(doc.data()!);
      });

      return result;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<TipoEventoModel>> getTipoEventos() {
    try {
      final tipoEventos = _firestore.collection(_collectionName).get().then(
            (value) => value.docs
                .map((e) => TipoEventoModel.fromMap(e.data()))
                .toList(),
          );
      return tipoEventos;
    } catch (e) {
      return Future.error(e);
    }
  }

  @override
  Future<TipoEventoModel> updateTipoEvento(TipoEventoModel tipoEvento) async {
    try {
      await _firestore
          .collection(_collectionName)
          .doc(tipoEvento.id)
          .update(tipoEvento.toMap());
      final novoTipoEvento = await getTipoEvento(tipoEvento.id);
      return novoTipoEvento!;
    } catch (e) {
      return Future.error(e);
    }
  }
}
