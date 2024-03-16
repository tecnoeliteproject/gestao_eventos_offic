// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:gestao_eventos/core/helpers/constants.dart';
import 'package:gestao_eventos/domain/entities/tag.dart';

class EventTag extends StatelessWidget {
  const EventTag({
    required this.tag,
    super.key,
  });

  final Tag tag;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: kDefaultPadding / 4,
        horizontal: kDefaultPadding,
      ),
      margin: const EdgeInsets.only(right: kDefaultPadding / 2),
      decoration: BoxDecoration(
        color: Color(tag.color).withAlpha(50),
        borderRadius: BorderRadius.circular(kDefaultPadding / 2),
      ),
      child: Text(
        tag.name,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: Color(tag.color),
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}
