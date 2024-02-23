import 'package:flutter/material.dart';
import 'package:gestao_eventos/presentation/painels/admin/tipo_eventos/widgets/tipo_evento_item.dart';

class TipoEventosGridView extends StatelessWidget {
  const TipoEventosGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final tipos = List.generate(20, (index) => index);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return TipoEventoItem(
            index: index,
          );
        },
        itemCount: tipos.length,
      ),
    );
  }
}
