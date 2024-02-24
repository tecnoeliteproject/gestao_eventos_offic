import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestao_eventos/core/helpers/constants.dart';
import 'package:gestao_eventos/presentation/painels/admin/create_tipo_evento/cubit/imagens_de_exemplo_cubit_cubit.dart';

class ImageAmostra extends StatelessWidget {
  const ImageAmostra({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 105,
      margin: const EdgeInsets.only(right: kDefaultPadding),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Center(
        child: TextButton(
          onPressed: () {
            context.read<ImagensDeExemploFormCubit>().onSelectImagem();
          },
          child: const Text('Selecionar'),
        ),
      ),
    );
  }
}
