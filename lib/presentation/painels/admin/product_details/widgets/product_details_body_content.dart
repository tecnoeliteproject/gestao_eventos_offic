import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:gestao_eventos/domain/entities/tipo_evento.dart';
import 'package:gestao_eventos/presentation/painels/admin/product_details/widgets/fotos_exemplo_widget.dart';

class ProductDetailsBodyContent extends StatelessWidget {
  const ProductDetailsBodyContent({required this.tipoEvento, super.key});

  final TipoEvento tipoEvento;

  @override
  Widget build(BuildContext context) {
    return _BodyContent(tipoEvento: tipoEvento);
  }
}

class _BodyContent extends StatelessWidget {
  const _BodyContent({
    required this.tipoEvento,
  });

  final TipoEvento tipoEvento;

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
          FotosExemploWidget(
            images: tipoEvento.exemplos.map((e) => e.url).toList(),
          ),
        ],
      ),
    );
  }
}
