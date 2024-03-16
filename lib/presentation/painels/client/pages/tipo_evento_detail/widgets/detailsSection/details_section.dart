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
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _Preco(),
                GutterSmall(),
                ClassificacaoDoEvento(),
              ],
            ),
            const Gutter(),
            const EventTagsList(),
            const Gutter(),
            Text(
              tipoEvento.name,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
            ),
            const GutterTiny(),
            Text(
              '13 convidados',
              style: Theme.of(context).textTheme.titleSmall,
            ),
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

class _Preco extends StatelessWidget {
  const _Preco();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        '56.000,00 Kz',
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSecondaryContainer,
            ),
      ),
    );
  }
}
