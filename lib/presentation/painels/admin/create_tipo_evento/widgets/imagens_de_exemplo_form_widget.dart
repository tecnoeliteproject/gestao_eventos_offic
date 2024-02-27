import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:gestao_eventos/presentation/painels/admin/create_tipo_evento/create_tipo_evento.dart';
import 'package:gestao_eventos/presentation/painels/admin/create_tipo_evento/cubit/imagens_de_exemplo_cubit_cubit.dart';
import 'package:gestao_eventos/presentation/painels/admin/create_tipo_evento/widgets/image_amostra_widget.dart';
import 'package:gestao_eventos/presentation/painels/admin/create_tipo_evento/widgets/mini_image_amostra_widget.dart';

class ImagensDeExemploFormWidget extends StatelessWidget {
  const ImagensDeExemploFormWidget({super.key});

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
          child:
              BlocBuilder<ImagensDeExemploFormCubit, ImagensDeExemploFromState>(
            builder: (context, state) {
              return ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ...List.generate(
                    state.exemplos.length,
                    MiniImageAmostra.new,
                  ),
                  ImageAmostra(
                    onPressed: () => context.read<ImagensDeExemploFormCubit>()
                      ..onSelectImagem(),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
