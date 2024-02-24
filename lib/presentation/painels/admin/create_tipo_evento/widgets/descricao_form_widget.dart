import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestao_eventos/presentation/painels/admin/create_tipo_evento/cubit/descricao_form_cubit_cubit.dart';

class DescricaoFormWidget extends StatelessWidget {
  const DescricaoFormWidget({super.key});

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
          maxLines: 3,
          validator: context.read<DescricaoFormCubit>().validateDescricao,
          onChanged: context.read<DescricaoFormCubit>().onUpdate,
          decoration: const InputDecoration(
            hintText: 'Ex: Festa de aniversário para 30 pessoas',
          ),
        ),
      ],
    );
  }
}
