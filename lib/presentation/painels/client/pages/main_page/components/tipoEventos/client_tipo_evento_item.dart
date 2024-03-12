import 'package:flutter/material.dart';
import 'package:gestao_eventos/domain/entities/tipo_evento.dart';

class ClientTipoEventoItem extends StatelessWidget {
  const ClientTipoEventoItem(
    this.tipoEvento, {
    required this.onPress,
    super.key,
    this.width = 200,
    this.aspectRetio = 1.02,
  });

  final double width;
  final TipoEvento tipoEvento;
  final double aspectRetio;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: GestureDetector(
        onTap: onPress,
        child: AspectRatio(
          aspectRatio: 1.02,
          child: SpecialOfferCard(
            category: tipoEvento.name,
            image: tipoEvento.image.url,
          ),
        ),
      ),
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    required this.category,
    required this.image,
    super.key,
  });

  final String category;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              image,
              fit: BoxFit.cover,
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black38,
                    Colors.black26.withOpacity(0.1),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Text(
                category,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
