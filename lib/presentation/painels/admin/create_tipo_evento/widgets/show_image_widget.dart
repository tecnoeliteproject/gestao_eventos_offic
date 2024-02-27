import 'package:flutter/material.dart';
import 'package:gestao_eventos/domain/entities/c_image.dart';
import 'package:gestao_eventos/presentation/painels/admin/create_tipo_evento/widgets/button_switch_image_widget.dart';

class ShowImageWidget extends StatelessWidget {
  const ShowImageWidget(this.imagem, {required this.onPressed, super.key});

  final CImage imagem;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    late Image imageWidget;
    if (imagem.bytes != null) {
      imageWidget = Image.memory(
        imagem.bytes!,
        fit: BoxFit.cover,
      );
    } else {
      imageWidget = Image.network(
        imagem.url,
        fit: BoxFit.cover,
      );
    }

    return Stack(
      fit: StackFit.expand,
      children: [
        imageWidget,
        ButtonSwitchImageWidget(
          onPressed: onPressed,
        ),
      ],
    );
  }
}
