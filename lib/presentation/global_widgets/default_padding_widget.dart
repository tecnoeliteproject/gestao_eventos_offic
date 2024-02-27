import 'package:flutter/material.dart';

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
      padding: const EdgeInsets.all(20),
      child: child,
    );
  }
}
