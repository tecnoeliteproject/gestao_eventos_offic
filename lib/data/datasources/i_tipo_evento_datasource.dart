import 'package:gestao_eventos/data/models/tipo_evento_model.dart';
import 'package:gestao_eventos/domain/entities/c_image.dart';

abstract class ITipoEventoDataSource {
  Future<List<TipoEventoModel>> getTipoEventos();
  Future<List<TipoEventoModel>> getArchivedTipoEventos();
  Future<TipoEventoModel?> getTipoEvento(String id);
  Future<bool> createTipoEvento(TipoEventoModel tipoEvento);
  Future<TipoEventoModel?> updateTipoEvento(TipoEventoModel tipoEvento);
  Future<bool> deleteTipoEvento(TipoEventoModel tipoEvento);
  Future<String> saveImage(CImage image);
  Future<bool> arquivarTipoEvento(TipoEventoModel tipoEvento);
  Future<bool> desarquivarTipoEvento(TipoEventoModel tipoEvento);
}
