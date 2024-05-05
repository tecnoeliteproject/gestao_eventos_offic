import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:gestao_eventos/core/dependences/get_it.dart';
import 'package:gestao_eventos/core/helpers/constants.dart';
import 'package:gestao_eventos/domain/entities/tipo_evento.dart';
import 'package:gestao_eventos/presentation/painels/client/pages/tipo_evento_detail/widgets/detailsSection/widgets/classificacao_do_evento.dart';
import 'package:gestao_eventos/presentation/painels/client/pages/tipo_evento_detail/widgets/detailsSection/widgets/event_tags_list.dart';

class DetailsSection extends StatelessWidget {
  const DetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final tipoEvento = getIt<TipoEvento>();

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultpadding / 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _BaseInformation(tipoEvento: tipoEvento),
            const GutterLarge(),
            const EventTagsList(),
            const GutterLarge(),
            Text(
              'Sobre o evento',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
            ),
            const GutterTiny(),
            Text(
              tipoEvento.description,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
        ),
      ),
    );
  }
}

class _BaseInformation extends StatelessWidget {
  const _BaseInformation({
    required this.tipoEvento,
  });

  final TipoEvento tipoEvento;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tipoEvento.name,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
            ),
            const GutterTiny(),
            Text(
              '13 lugares',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
        ),
        const ClassificacaoDoEvento(),
      ],
    );
  }
}
