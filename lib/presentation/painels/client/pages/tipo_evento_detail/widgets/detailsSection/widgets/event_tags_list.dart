import 'package:flutter/material.dart';
import 'package:gestao_eventos/core/helpers/constants.dart';
import 'package:gestao_eventos/domain/entities/tag.dart';
import 'package:gestao_eventos/presentation/painels/client/pages/tipo_evento_detail/widgets/detailsSection/widgets/event_tag.dart';

class EventTagsList extends StatelessWidget {
  const EventTagsList({super.key});

  @override
  Widget build(BuildContext context) {
    final tags = [
      Tag(id: '1', name: 'Casamento', color: Colors.red.value),
      Tag(id: '2', name: 'Aniversario', color: Colors.green.value),
      Tag(id: '3', name: 'Boda', color: Colors.blue.value),
      Tag(id: '4', name: 'Almoço', color: Colors.black.value),
    ];

    if (tags.isEmpty) {
      return const SizedBox();
    }

    if (tags.length == 1) {
      return EventTag(
        tag: tags[0],
      );
    }

    return SizedBox(
      height: kDefaultPadding * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tags.length,
        itemBuilder: (context, index) {
          final tag = tags[index];

          return EventTag(
            tag: tag,
          );
        },
      ),
    );
  }
}
