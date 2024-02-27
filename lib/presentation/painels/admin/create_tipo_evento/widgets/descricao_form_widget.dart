import 'package:flutter/material.dart';

class DescricaoFormWidget extends StatelessWidget {
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Descrição',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        TextFormField(
          initialValue: initialValue,
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
