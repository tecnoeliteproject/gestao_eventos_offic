import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestao_eventos/presentation/painels/admin/create_tipo_evento/cubit/name_form_cubit_cubit.dart';

class NameFormWidget extends StatelessWidget {
  const NameFormWidget({super.key});

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
          validator: BlocProvider.of<NameFormCubitCubit>(context).validateName,
          onChanged: BlocProvider.of<NameFormCubitCubit>(context).onUpdate,
          decoration: const InputDecoration(
            hintText: 'Ex: Festa de Aniversário',
          ),
        ),
      ],
    );
  }
}
