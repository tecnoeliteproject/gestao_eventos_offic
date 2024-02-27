import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:gestao_eventos/core/dependences/get_it.dart';
import 'package:gestao_eventos/domain/entities/tipo_evento.dart';
import 'package:gestao_eventos/presentation/painels/admin/create_tipo_evento/cubit/descricao_form_cubit_cubit.dart';
import 'package:gestao_eventos/presentation/painels/admin/create_tipo_evento/cubit/name_form_cubit_cubit.dart';
import 'package:gestao_eventos/presentation/painels/admin/create_tipo_evento/widgets/descricao_form_widget.dart';
import 'package:gestao_eventos/presentation/painels/admin/create_tipo_evento/widgets/name_form_widget.dart';
import 'package:gestao_eventos/presentation/painels/admin/edit_tipo_evento/bloc/bloc.dart';

import 'package:gestao_eventos/presentation/painels/admin/edit_tipo_evento/widgets/edit_imagem_form_widget.dart';
import 'package:gestao_eventos/presentation/painels/admin/edit_tipo_evento/widgets/edit_imagens_de_exemplo_form_widget.dart';

/// {@template edit_tipo_evento_body}
/// Body of the EditTipoEventoPage.
///
/// Add what it does
/// {@endtemplate}
class EditTipoEventoBody extends StatelessWidget {
  /// {@macro edit_tipo_evento_body}
  const EditTipoEventoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildNameForm(context),
            const GutterLarge(),
            _buildDescricaoForm(context),
            const GutterLarge(),
            const EditImagemFormWidget(),
            const GutterLarge(),
            const EditImagensDeExemploFormWidget(),
          ],
        ),
      ),
    );
  }

  DescricaoFormWidget _buildDescricaoForm(BuildContext context) {
    return DescricaoFormWidget(
      initialValue: getIt<TipoEvento>().description,
      validator: context.read<DescricaoFormCubit>().validateDescricao,
      onChanged: context.read<DescricaoFormCubit>().onUpdate,
    );
  }

  NameFormWidget _buildNameForm(BuildContext context) {
    return NameFormWidget(
      initialValue: getIt<TipoEvento>().name,
      validator: BlocProvider.of<NameFormCubitCubit>(context).validateName,
      onChanged: BlocProvider.of<NameFormCubitCubit>(context).onUpdate,
    );
  }
}
