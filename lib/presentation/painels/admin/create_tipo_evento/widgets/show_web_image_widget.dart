import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gestao_eventos/presentation/painels/admin/create_tipo_evento/widgets/button_switch_image_widget.dart';

class ShowWebImageWidget extends StatelessWidget {
  const ShowWebImageWidget(this.bytes, {required this.onPressed, super.key});

  final Uint8List bytes;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final image = Image.memory(
      bytes,
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
