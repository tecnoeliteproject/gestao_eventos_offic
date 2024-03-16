import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';
import 'package:gestao_eventos/domain/entities/tipo_evento.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    required this.tipoEvento,
    super.key,
  });

  final TipoEvento tipoEvento;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: tipoEvento.image.url,
      fit: BoxFit.cover,
    );
  }
}
