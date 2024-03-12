import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:gestao_eventos/core/dependences/get_it.dart';
import 'package:gestao_eventos/presentation/painels/admin/create_tipo_evento/create_tipo_evento.dart';
import 'package:gestao_eventos/presentation/painels/admin/create_tipo_evento/cubit/descricao_form_cubit_cubit.dart';
import 'package:gestao_eventos/presentation/painels/admin/create_tipo_evento/cubit/name_form_cubit_cubit.dart';
import 'package:gestao_eventos/presentation/painels/admin/create_tipo_evento/widgets/descricao_form_widget.dart';
import 'package:gestao_eventos/presentation/painels/admin/create_tipo_evento/widgets/imagem_form_widget.dart';
import 'package:gestao_eventos/presentation/painels/admin/create_tipo_evento/widgets/imagens_de_exemplo_form_widget.dart';
import 'package:gestao_eventos/presentation/painels/admin/create_tipo_evento/widgets/name_form_widget.dart';
import 'package:gestao_eventos/presentation/painels/admin/tipo_eventos/cubit/list_tipo_eventos_cubit.dart';

class CreateTipoEventoBody extends StatelessWidget {
  const CreateTipoEventoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateTipoEventoBloc, CreateTipoEventoState>(
      listener: (context, state) {
        if (state is CreateTipoEventoSuccess) {
          getIt<ListTipoEventosCubit>().listTipoEventos();
          Navigator.of(context).pop();
        }
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _buildNameForm(context),
              const GutterLarge(),
              _buildDescricaoForm(context),
              const GutterLarge(),
              const ImagemFormWidget(),
              const GutterLarge(),
              const ImagensDeExemploFormWidget(),
            ],
          ),
        ),
      ),
    );
  }

  DescricaoFormWidget _buildDescricaoForm(BuildContext context) {
    return DescricaoFormWidget(
      validator: context.read<DescricaoFormCubit>().validateDescricao,
      onChanged: context.read<DescricaoFormCubit>().onUpdate,
    );
  }

  NameFormWidget _buildNameForm(BuildContext context) {
    return NameFormWidget(
      validator: BlocProvider.of<NameFormCubitCubit>(context).validateName,
      onChanged: BlocProvider.of<NameFormCubitCubit>(context).onUpdate,
    );
  }
}
