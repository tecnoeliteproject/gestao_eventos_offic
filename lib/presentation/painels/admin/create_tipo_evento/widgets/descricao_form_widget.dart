import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DescricaoFormWidget extends HookWidget {
  const DescricaoFormWidget({
    super.key,
    this.validator,
    this.onChanged,
    this.initialValue,
  });

  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    final descriptionController = useTextEditingController();

    descriptionController
      ..addListener(() {
        onChanged!(descriptionController.text);
      })
      ..text = initialValue ?? '';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Descrição',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        TextFormField(
          controller: descriptionController,
          validator: validator,
          onChanged: onChanged,
          maxLines: 3,
          decoration: const InputDecoration(
            hintText: 'Ex: Festa de aniversário para 30 pessoas',
          ),
        ),
      ],
    );
  }
}
