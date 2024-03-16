// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

import 'package:gestao_eventos/domain/entities/tipo_evento.dart';

class HeaderDetails extends StatelessWidget {
  const HeaderDetails({
    required this.tipoEvento,
    super.key,
  });

  final TipoEvento tipoEvento;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _CustomDetailsButton(
          onTap: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        const Spacer(),
        _CustomDetailsButton(
          onTap: () => Navigator.pop(context),
          icon: const Icon(
            Icons.favorite_border,
            color: Colors.black,
          ),
        ),
        const Gutter(),
        _CustomDetailsButton(
          onTap: () => Navigator.pop(context),
          icon: const Icon(
            Icons.share,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

class _CustomDetailsButton extends StatelessWidget {
  const _CustomDetailsButton({
    required this.onTap,
    required this.icon,
  });

  final VoidCallback onTap;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withAlpha(200),
      ),
      child: IconButton(
        onPressed: onTap,
        icon: icon,
        padding: EdgeInsets.zero,
      ),
    );
  }
}
