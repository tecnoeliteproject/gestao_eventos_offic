import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:gestao_eventos/core/dependences/get_it.dart';
import 'package:gestao_eventos/core/helpers/constants.dart';
import 'package:gestao_eventos/domain/entities/tipo_evento.dart';
import 'package:gestao_eventos/presentation/painels/admin/tipo_eventos/cubit/list_tipo_eventos_cubit.dart';

class ArchiveTipoEventoConfimDialog extends StatelessWidget {
  const ArchiveTipoEventoConfimDialog({
    required this.tipoEvento,
    super.key,
  });

  final TipoEvento tipoEvento;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text('Arquivar Tipo de evento'),
      contentPadding: const EdgeInsets.all(kDefaultPadding),
      children: [
        const Text('Deseja realmente arquivar este tipo de evento?'),
        const Gutter(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancelar'),
            ),
            const GutterSmall(),
            TextButton(
              onPressed: () {
                getIt<ListTipoEventosCubit>().arquivarTipoEvento(tipoEvento);

                Navigator.pop(context);
              },
              child: const Text('Ok'),
            ),
          ],
        ),
      ],
    );
  }
}
