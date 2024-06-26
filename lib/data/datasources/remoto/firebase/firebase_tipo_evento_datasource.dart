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
        'isArchived': tipoEvento.isArchived ?? false,
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
        if (!doc.exists) {
          return null;
        }

        final map = <String, dynamic>{
          'id': doc.id,
          'name': doc.data()!['name'],
          'description': doc.data()!['description'],
        };

        if (doc.data()!['exemplos'] != null) {
          final exemplos = (doc.data()!['exemplos'] as List<dynamic>)
              .map(
                (e) => CImage(url: e as String),
              )
              .toList();
          map['exemplos'] = exemplos;
        }

        if (doc.data()!['image'] != null) {
          map['image'] = CImage(url: doc.data()!['image'] as String);
        }

        return TipoEventoModel.fromMap(map);
      });

      return result;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<TipoEventoModel>> getTipoEventos() async {
    final result = await _getGenericTipoEventos();

    return result
        .where(
          (element) =>
              element.isArchived == null || element.isArchived! == false,
        )
        .toList();
  }

  Future<List<TipoEventoModel>> _getGenericTipoEventos() {
    try {
      final tipoEventos = _firestore.collection(_collectionName).get().then(
            (value) => value.docs.map(
              (doc) {
                final map = <String, dynamic>{
                  'id': doc.id,
                  'name': doc.data()['name'],
                  'description': doc.data()['description'],
                  'isArchived': doc.data()['isArchived'] ?? false,
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
  Future<TipoEventoModel?> updateTipoEvento(TipoEventoModel tipoEvento) async {
    try {
      var image = tipoEvento.image;

      // verifica se a imagens ja existe. Caso sim, nao precisara subir
      if (!tipoEvento.image.url.contains('firebasestorage.googleapis.com')) {
        final result = await saveImage(tipoEvento.image);
        image = CImage(url: result);
      }

      // verifica se os exemplos ja existem. Caso sim, nao precisara subir
      final amostrasUrl = <String>[];
      for (final element in tipoEvento.exemplos) {
        if (!element.url.contains('firebasestorage.googleapis.com')) {
          amostrasUrl.add(await saveImage(element));
        } else {
          amostrasUrl.add(element.url);
        }
      }

      final imageAssert = image.url.contains('firebasestorage.googleapis.com');
      assert(
        imageAssert,
        'Imagem invalida',
      );

      final map = <String, dynamic>{
        'id': tipoEvento.id,
        'name': tipoEvento.name,
        'image': image.url,
        'description': tipoEvento.description,
        'exemplos': amostrasUrl,
        'isArchived': tipoEvento.isArchived ?? false,
      };

      await _firestore
          .collection(_collectionName)
          .doc(tipoEvento.id)
          .update(map);

      final ipoEvento = await getTipoEvento(tipoEvento.id);
      return ipoEvento;
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

  @override
  Future<bool> arquivarTipoEvento(TipoEventoModel tipoEvento) async {
    final result = await updateTipoEvento(
      tipoEvento.copyWith(isArchived: true),
    );

    return result != null;
  }

  @override
  Future<bool> desarquivarTipoEvento(TipoEventoModel tipoEvento) async {
    final result = await updateTipoEvento(
      tipoEvento.copyWith(isArchived: false),
    );

    return result != null;
  }

  @override
  Future<List<TipoEventoModel>> getArchivedTipoEventos() async {
    final result = await _getGenericTipoEventos();

    return result
        .where(
          (element) =>
              element.isArchived != null && element.isArchived! == true,
        )
        .toList();
  }
}
