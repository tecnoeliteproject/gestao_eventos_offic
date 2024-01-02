import 'package:flutter/material.dart';
import 'package:gestao_eventos/core/helpers/constants.dart';
import 'package:gestao_eventos/presentation/home/bloc/bloc.dart';
import 'package:gestao_eventos/presentation/home/widgets/evento_categoria_area_widget.dart';
import 'package:gestao_eventos/presentation/home/widgets/header_area_widget.dart';
import 'package:gestao_eventos/presentation/home/widgets/tipo_produto_selecionado_widget.dart';

/// {@template home_body}
/// Body of the HomePage.
///
/// Add what it does
/// {@endtemplate}
class HomeBody extends StatelessWidget {
  /// {@macro home_body}
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return const Column(
          children: [
            HeaderAreaWidget(),
            SizedBox(height: kDefaultpadding * 2),
            EventCategoriaAreaWidget(),
            SizedBox(height: kDefaultpadding * 2),
            TipoProdutoSelecionado(),
          ],
        );
      },
    );
  }
}
