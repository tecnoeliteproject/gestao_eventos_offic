import 'package:flutter/material.dart';
import 'package:gestao_eventos/core/helpers/constants.dart';
import 'package:gestao_eventos/presentation/home/widgets/evento_area_widget.dart';
import 'package:gestao_eventos/presentation/home/widgets/title_evento_selecionado.dart';

class TipoProdutoSelecionado extends StatelessWidget {
  const TipoProdutoSelecionado({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TitleEventoSelecionadoWidget(),
        SizedBox(height: kDefaultpadding * 2),
        EventoAreaWidget(),
      ],
    );
  }
}
