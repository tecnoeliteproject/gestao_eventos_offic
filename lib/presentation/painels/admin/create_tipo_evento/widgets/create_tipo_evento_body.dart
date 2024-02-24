import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:gestao_eventos/presentation/painels/admin/create_tipo_evento/widgets/descricao_form_widget.dart';
import 'package:gestao_eventos/presentation/painels/admin/create_tipo_evento/widgets/imagem_form_widget.dart';
import 'package:gestao_eventos/presentation/painels/admin/create_tipo_evento/widgets/imagens_de_exemplo_form_widget.dart';
import 'package:gestao_eventos/presentation/painels/admin/create_tipo_evento/widgets/name_form_widget.dart';

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
    return const Padding(
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
    );
  }
}
