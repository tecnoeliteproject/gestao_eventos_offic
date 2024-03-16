import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gestao_eventos/core/helpers/constants.dart';
import 'package:gestao_eventos/domain/entities/tipo_evento.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageWidget extends HookWidget {
  const ImageWidget({
    required this.tipoEvento,
    super.key,
  });

  final TipoEvento tipoEvento;

  @override
  Widget build(BuildContext context) {
    final controller = usePageController();
    final images = [
      tipoEvento.image.url,
      ...tipoEvento.exemplos.map((e) => e.url),
    ];

    return Stack(
      children: [
        PageView.builder(
          controller: controller,
          itemCount: images.length,
          itemBuilder: (context, index) {
            final image = images[index];

            return CachedNetworkImage(
              imageUrl: image,
              fit: BoxFit.cover,
            );
          },
        ),
        _ShowIndicator(
          controller: controller,
          images: images,
        ),
      ],
    );
  }
}

class _ShowIndicator extends StatelessWidget {
  const _ShowIndicator({
    required this.controller,
    required this.images,
  });

  final PageController controller;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding / 2),
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: kDefaultPadding / 3,
            horizontal: kDefaultPadding / 2,
          ),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: SmoothPageIndicator(
            controller: controller, // PageController
            count: images.length,
            onDotClicked: (index) {
              controller.animateToPage(
                index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            },
          ),
        ),
      ),
    );
  }
}
