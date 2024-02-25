import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:gestao_eventos/presentation/painels/admin/create_tipo_evento/create_tipo_evento.dart';
import 'package:gestao_eventos/presentation/painels/admin/create_tipo_evento/widgets/descricao_form_widget.dart';
import 'package:gestao_eventos/presentation/painels/admin/create_tipo_evento/widgets/imagem_form_widget.dart';
import 'package:gestao_eventos/presentation/painels/admin/create_tipo_evento/widgets/imagens_de_exemplo_form_widget.dart';
import 'package:gestao_eventos/presentation/painels/admin/create_tipo_evento/widgets/name_form_widget.dart';
import 'package:gestao_eventos/presentation/painels/admin/tipo_eventos/cubit/list_tipo_eventos_cubit.dart';
import 'package:gestao_eventos/presentation/painels/admin/tipo_eventos/tipo_eventos.dart';

/// {@template create_tipo_evento_body}
/// Body of the CreateTipoEventoPage.
///
/// Add what it does
/// {@endtemplate}
class CreateTipoEventoBody extends StatelessWidget {
  /// {@macro create_tipo_evento_body}
  const CreateTipoEventoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateTipoEventoBloc, CreateTipoEventoState>(
      listener: (context, state) {
        if (state is CreateTipoEventoSuccess) {
          BlocProvider.of<ListTipoEventosCubit>(context).listTipoEventos();
          Navigator.of(context).pop();
        }
      },
      child: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            NameFormWidget(),
            GutterLarge(),
            DescricaoFormWidget(),
            GutterLarge(),
            ImagemFormWidget(),
            GutterLarge(),
            ImagensDeExemploFormWidget(),
          ],
        ),
      ),
    );
  }
}
