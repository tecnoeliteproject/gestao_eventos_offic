import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:gestao_eventos/core/dependences/get_it.dart';
import 'package:gestao_eventos/core/error/tipo_evento_errors.dart';
import 'package:gestao_eventos/data/datasources/i_tipo_evento_datasource.dart';
import 'package:gestao_eventos/data/models/tipo_evento_model.dart';
import 'package:gestao_eventos/domain/entities/c_image.dart';

class FirebaseTipoTipoEventoDataSource implements ITipoEventoDataSource {
  FirebaseTipoTipoEventoDataSource({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore {
    _storage = getIt();
  }

  final FirebaseFirestore _firestore;
  late final FirebaseStorage _storage;
  final String _collectionName = 'tipoEventos';
  final String _imageStorageBucket = '/images/tipoEventos';

  @override
  Future<bool> createTipoEvento(TipoEventoModel tipoEvento) async {
    try {
      final imageUrl = await saveImage(tipoEvento.image);

      final amostrasUrl = <String>[];
      for (final element in tipoEvento.exemplos) {
        final exemploImage = await saveImage(element);
        amostrasUrl.add(exemploImage);
      }

      final map = {
        'id': tipoEvento.id,
        'name': tipoEvento.name,
        'description': tipoEvento.description,
        'image': imageUrl,
        'exemplos': amostrasUrl,
      };

      await _firestore.collection(_collectionName).doc(tipoEvento.id).set(map);
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
        if (doc.data() == null) return null;

        if (doc.data()!['exemplos'] != null) {
          final exemplos = (doc.data()!['exemplos'] as List<String>).map(
            (e) => CImage(url: e),
          );
          doc.data()!['exemplos'] = exemplos;
        }

        if (doc.data()!['image'] != null) {
          doc.data()!['image'] = CImage(url: doc.data()!['image'] as String);
        }

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
            (value) => value.docs.map(
              (doc) {
                final map = <String, dynamic>{
                  'id': doc.id,
                  'name': doc.data()['name'],
                  'description': doc.data()['description'],
                };
                if (doc.data()['exemplos'] != null) {
                  final exemplos = (doc.data()['exemplos'] as List<dynamic>)
                      .map(
                        (e) => CImage(url: e as String),
                      )
                      .toList();
                  map['exemplos'] = exemplos;
                }

                if (doc.data()['image'] != null) {
                  map['image'] = CImage(url: doc.data()['image'] as String);
                }

                return TipoEventoModel.fromMap(map);
              },
            ).toList(),
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
          .update({});
      final novoTipoEvento = await getTipoEvento(tipoEvento.id);
      return novoTipoEvento!;
    } catch (e) {
      return Future.error(e);
    }
  }

  // salva a imagem e devolve a url de download
  @override
  Future<String> saveImage(CImage image) async {
    try {
      final result = await _storage
          .ref(
            '$_imageStorageBucket/image_${DateTime.now().toIso8601String()}_${image.url}',
          )
          .putData(image.bytes!);

      return result.ref.getDownloadURL();
    } catch (e) {
      throw UploadImageException();
    }
  }
}
