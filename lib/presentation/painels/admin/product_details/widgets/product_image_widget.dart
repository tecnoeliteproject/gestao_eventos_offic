import 'package:flutter/material.dart';
import 'package:gestao_eventos/core/helpers/constants.dart';
import 'package:gestao_eventos/data/models/tipo_evento_model.dart';
import 'package:gestao_eventos/domain/entities/tipo_evento.dart';

class ProductImageWidget extends StatelessWidget {
  const ProductImageWidget({
    required this.tipoEvento,
    super.key,
  });

  final TipoEvento tipoEvento;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: SizedBox(
        height: size.height * 0.45,
        child: Expanded(
          child: _ImageWidget(image: tipoEvento.image.url),
        ),
      ),
    );
  }
}

class _ImageWidget extends StatelessWidget {
  const _ImageWidget({
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            height: constraints.maxHeight,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}
