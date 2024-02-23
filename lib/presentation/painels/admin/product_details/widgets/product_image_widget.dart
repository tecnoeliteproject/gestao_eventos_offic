import 'package:flutter/material.dart';
import 'package:gestao_eventos/data/models/tipo_evento_model.dart';

class ProductImageWidget extends StatelessWidget {
  const ProductImageWidget({
    required this.tipoEvento,
    super.key,
  });

  final TipoEventoModel tipoEvento;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(8),
      child: SizedBox(
        height: size.height * 0.45,
        child: Column(
          children: [
            AppBar(
              title: Text(tipoEvento.name),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.edit),
                ),
              ],
            ),
            Expanded(child: _ImageWidget(image: tipoEvento.image)),
          ],
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
        return Container(
          height: constraints.maxHeight,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(image),
              fit: BoxFit.fitHeight,
            ),
          ),
        );
      },
    );
  }
}
