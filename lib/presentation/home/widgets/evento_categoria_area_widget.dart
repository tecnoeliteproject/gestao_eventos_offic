import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:gestao_eventos/presentation/home/widgets/evento_categoria_item_widget.dart';

class EventCategoriaAreaWidget extends StatelessWidget {
  const EventCategoriaAreaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          Gutter(),
          EventoCategoriaItem(
            icon: Icons.portable_wifi_off,
            text: Text('Pedidos'),
          ),
          EventoCategoriaItem(
            icon: Icons.settings,
            text: Text('Casamentos'),
            isSelected: true,
          ),
          EventoCategoriaItem(
            icon: Icons.text_snippet,
            text: Text('Aniversarios'),
          ),
          EventoCategoriaItem(
            icon: Icons.text_snippet,
            text: Text('Aniversarios'),
          ),
          EventoCategoriaItem(
            icon: Icons.text_snippet,
            text: Text('Aniversarios'),
          ),
          EventoCategoriaItem(
            icon: Icons.text_snippet,
            text: Text('Aniversarios'),
          ),
        ],
      ),
    );
  }
}
