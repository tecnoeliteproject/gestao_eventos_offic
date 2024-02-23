import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:gestao_eventos/data/models/tipo_evento_model.dart';
import 'package:gestao_eventos/presentation/painels/admin/product_details/widgets/fotos_exemplo_widget.dart';

class ProductDetailsBodyContent extends StatelessWidget {
  const ProductDetailsBodyContent({required this.tipoEvento, super.key});

  final TipoEventoModel tipoEvento;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(45)),
      ),
      child: _BodyContent(tipoEvento: tipoEvento),
    );
  }
}

class _BodyContent extends StatelessWidget {
  const _BodyContent({
    required this.tipoEvento,
  });

  final TipoEventoModel tipoEvento;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Descrição',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
          ),
          const GutterSmall(),
          Text(tipoEvento.description),
          const GutterLarge(),
          const FotosExemploWidget(
            images: [
              'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
              'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
              'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
              'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
              'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
              'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
              'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
              'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
              'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
              'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
              'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
              'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
              'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
            ],
          ),
        ],
      ),
    );
  }
}
