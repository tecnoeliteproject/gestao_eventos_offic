// ignore_for_file: inference_failure_on_instance_creation

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gestao_eventos/domain/entities/tipo_evento.dart';
import 'package:gestao_eventos/presentation/painels/admin/product_details/view/product_details_page.dart';

class TipoEventoItem extends StatelessWidget {
  const TipoEventoItem({
    required this.tipoEvento,
    super.key,
  });

  final TipoEvento tipoEvento;

  void _onTap(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) {
          return ProductDetailsPage(tipoEvento: tipoEvento);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (kDebugMode) {
      print(size);
    }
    return GestureDetector(
      onTap: () => _onTap(context),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: NetworkImage(
                      tipoEvento.image.url,
                    ),
                  ),
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    limitText(
                      size,
                      tipoEvento.name,
                    ),
                    overflow: TextOverflow.clip,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.more_vert),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String limitText(Size screenSize, String text) {
    var limit = 21;

    if (screenSize.width < 360.0) {
      limit = 8;
    }

    if (screenSize.width > 360.0 && screenSize.width < 380.0) {
      limit = 11;
    }

    if (screenSize.width > 380.0 && screenSize.width < 400.0) {
      limit = 12;
    }

    if (screenSize.width > 400.0 && screenSize.width < 453.0) {
      limit = 15;
    }

    if (screenSize.width > 460.0 && screenSize.width < 500.0) {
      limit = 22;
    }
    if (screenSize.width > 590.0) {
      limit = 30;
    }

    return text.length > limit ? '${text.substring(0, limit)}...' : text;
  }
}
