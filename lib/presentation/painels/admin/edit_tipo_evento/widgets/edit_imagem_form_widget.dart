import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:gestao_eventos/core/dependences/get_it.dart';
import 'package:gestao_eventos/core/helpers/constants.dart';
import 'package:gestao_eventos/domain/entities/tipo_evento.dart';
import 'package:gestao_eventos/presentation/painels/admin/create_tipo_evento/widgets/show_image_widget.dart';
import 'package:gestao_eventos/presentation/painels/admin/edit_tipo_evento/cubit/edit_imagem_form_cubit.dart';

class EditImagemFormWidget extends StatelessWidget {
  const EditImagemFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Imagem',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const Gutter(),
          const _ImageWidget(),
        ],
      ),
    );
  }
}

class _ImageWidget extends StatelessWidget {
  const _ImageWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding * 2,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22),
        child: Container(
          width: double.infinity,
          height: 250,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
          child: BlocBuilder<EditImagemFormCubit, EditImagemFormState>(
            buildWhen: (previous, current) => previous.imagem != current.imagem,
            bloc: context.read<EditImagemFormCubit>()
              ..setImagem(getIt<TipoEvento>().image),
            builder: (context, state) {
              if (state is EditImagemFormChanged) {
                return ShowImageWidget(
                  state.imagem!,
                  onPressed: context.read<EditImagemFormCubit>().onSelectImagem,
                );
              }

              return const _PickImageWidget();
            },
          ),
        ),
      ),
    );
  }
}

class _PickImageWidget extends StatelessWidget {
  const _PickImageWidget();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton.icon(
        onPressed: context.read<EditImagemFormCubit>().onSelectImagem,
        icon: const Icon(Icons.upload),
        label: const Text('Selecionar imagem'),
      ),
    );
  }
}
