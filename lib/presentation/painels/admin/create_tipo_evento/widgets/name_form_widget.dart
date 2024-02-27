// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class NameFormWidget extends StatelessWidget {
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Nome',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        TextFormField(
          initialValue: initialValue,
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
