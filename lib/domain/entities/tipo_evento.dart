import 'package:gestao_eventos/domain/entities/c_image.dart';

class TipoEvento {
  TipoEvento({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.exemplos,
  });

  final String id;
  final String name;
  final CImage image;
  final String description;
  List<CImage> exemplos;
}
