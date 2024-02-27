import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:gestao_eventos/core/dependences/get_it.dart';
import 'package:gestao_eventos/domain/entities/tipo_evento.dart';
import 'package:gestao_eventos/presentation/painels/admin/create_tipo_evento/widgets/image_amostra_widget.dart';
import 'package:gestao_eventos/presentation/painels/admin/edit_tipo_evento/cubit/edit_imagens_de_exemplo_cubit_cubit.dart';
import 'package:gestao_eventos/presentation/painels/admin/edit_tipo_evento/widgets/edit_mini_image_amostra_widget.dart';

class EditImagensDeExemploFormWidget extends StatelessWidget {
  const EditImagensDeExemploFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Imagens de amostras',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const Gutter(),
        SizedBox(
          height: 125,
          child: BlocBuilder<EditImagensDeExemploFormCubit,
              EditImagensDeExemploFromState>(
            bloc: context.read<EditImagensDeExemploFormCubit>()
              ..setExemplos(
                getIt<TipoEvento>().exemplos,
              ),
            builder: (context, state) {
              return ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ...List.generate(
                    state.exemplos.length,
                    EditMiniImageAmostra.new,
                  ),
                  const ImageAmostra(),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
