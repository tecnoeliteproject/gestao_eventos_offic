import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gestao_eventos/presentation/painels/admin/create_tipo_evento/widgets/button_switch_image_widget.dart';

class ShowImageWidget extends StatelessWidget {
  const ShowImageWidget(this.path, {required this.onPressed, super.key});

  final String path;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final image = Image.file(
      File(path),
      fit: BoxFit.cover,
    );

    return Stack(
      fit: StackFit.expand,
      children: [
        image,
        ButtonSwitchImageWidget(
          onPressed: onPressed,
        ),
      ],
    );
  }
}
