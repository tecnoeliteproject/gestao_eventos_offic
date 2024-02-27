// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_single_cascade_in_expression_statements
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class NameFormWidget extends HookWidget {
  const NameFormWidget({
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
    final nameController = useTextEditingController();

    nameController
      ..addListener(() {
        onChanged!(nameController.text);
      })
      ..text = initialValue ?? '';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Nome',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        TextFormField(
          controller: nameController,
          validator: validator,
          onChanged: onChanged,
          decoration: const InputDecoration(
            hintText: 'Ex: Festa de Aniversário',
          ),
        ),
      ],
    );
  }
}
