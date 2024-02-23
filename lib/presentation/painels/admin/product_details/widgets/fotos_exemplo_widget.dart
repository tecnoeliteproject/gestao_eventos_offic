import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

class FotosExemploWidget extends StatelessWidget {
  const FotosExemploWidget({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Fotos de exemplo',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              ),
        ),
        const Gutter(),
        SizedBox(
          height: 140,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: images.length,
            itemBuilder: (c, i) => _ImageExemplo(
              image: images[i],
            ),
          ),
        ),
      ],
    );
  }
}

class _ImageExemplo extends StatelessWidget {
  const _ImageExemplo({
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: SizedBox(
          width: 120,
          child: Image(
            fit: BoxFit.cover,
            image: NetworkImage(
              image,
            ),
          ),
        ),
      ),
    );
  }
}
