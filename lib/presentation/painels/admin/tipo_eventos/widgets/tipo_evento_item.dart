// ignore_for_file: inference_failure_on_instance_creation

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gestao_eventos/data/models/tipo_evento_model.dart';
import 'package:gestao_eventos/presentation/painels/admin/product_details/view/product_details_page.dart';

class TipoEventoItem extends StatelessWidget {
  const TipoEventoItem({
    required this.index,
    super.key,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (kDebugMode) {
      print(size);
    }
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) {
              return ProductDetailsPage(
                tipoEvento: TipoEventoModel(
                  id: '$index',
                  description:
                      'Cobrimos todo tipo de casamento. Desde casamentos '
                      'de criancas e adultos, para casamentos de adultos. '
                      'Cobrimos todo tipo de casamento. Desde casamentos '
                      'de criancas e adultos, para casamentos de adultos.',
                  name: 'Casamentos de adultos $index',
                  image:
                      'https://www.helium10.com/app/uploads/2020/04/vit-c.jpg',
                ),
              );
            },
          ),
        );
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      'https://www.helium10.com/app/uploads/2020/04/vit-c.jpg',
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
                      'Casamentos de adultos Casamentos de adultos',
                    ),
                    overflow: TextOverflow.clip,
                    style: const TextStyle(
                      fontSize: 12,
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
