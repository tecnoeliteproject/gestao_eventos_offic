import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestao_eventos/core/helpers/constants.dart';
import 'package:gestao_eventos/presentation/painels/admin/create_tipo_evento/cubit/imagens_de_exemplo_cubit_cubit.dart';
import 'package:gestao_eventos/presentation/painels/admin/create_tipo_evento/widgets/image_amostra_widget.dart';
import 'package:gestao_eventos/presentation/painels/admin/create_tipo_evento/widgets/show_image_widget.dart';

class MiniImageAmostra extends StatelessWidget {
  const MiniImageAmostra(this.index, {super.key});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: kDefaultPadding,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22),
        child: Container(
          width: 115,
          height: 125,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
          child:
              BlocBuilder<ImagensDeExemploFormCubit, ImagensDeExemploFromState>(
            builder: (context, state) {
              if (state is ImagensDeExemploCubitChanged) {
                final image = state.exemplos[index];

                return ShowImageWidget(
                  image,
                  onPressed: () => context
                      .read<ImagensDeExemploFormCubit>()
                      .onSwitchImagem(index),
                );
              }

              return ImageAmostra(
                onPressed: () => context
                    .read<ImagensDeExemploFormCubit>()
                    .onSwitchImagem(index),
              );
            },
          ),
        ),
      ),
    );
  }
}
