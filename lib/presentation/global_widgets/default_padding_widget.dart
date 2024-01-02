import 'package:flutter/material.dart';
import 'package:gestao_eventos/core/helpers/constants.dart';

class DefaultPaddingWidget extends StatelessWidget {
  const DefaultPaddingWidget({
    required this.child,
    super.key,
    this.padding,
  });

  final Widget child;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultpadding),
      child: child,
    );
  }
}
