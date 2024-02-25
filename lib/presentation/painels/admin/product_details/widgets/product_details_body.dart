import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:gestao_eventos/core/helpers/constants.dart';
import 'package:gestao_eventos/domain/entities/tipo_evento.dart';
import 'package:gestao_eventos/presentation/painels/admin/product_details/widgets/product_details_body_content.dart';
import 'package:gestao_eventos/presentation/painels/admin/product_details/widgets/product_image_widget.dart';

class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({required this.tipoEvento, super.key});

  final TipoEvento tipoEvento;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _AppBar(tipoEvento: tipoEvento),
          ProductImageWidget(tipoEvento: tipoEvento),
          const Gutter(),
          ProductDetailsBodyContent(tipoEvento: tipoEvento),
        ],
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({
    required this.tipoEvento,
  });

  final TipoEvento tipoEvento;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: AppBar(
        title: Text(tipoEvento.name),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
    );
  }
}
