import 'package:flutter/material.dart';
import 'package:gestao_eventos/core/helpers/constants.dart';

class ImageAmostra extends StatelessWidget {
  const ImageAmostra({required this.onPressed, super.key});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 105,
      margin: const EdgeInsets.only(right: kDefaultPadding),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Center(
        child: TextButton(
          onPressed: onPressed,
          child: const Text('Selecionar'),
        ),
      ),
    );
  }
}
