import 'package:flutter/material.dart';
import 'package:gestao_eventos/core/helpers/constants.dart';
import 'package:gestao_eventos/presentation/global_widgets/default_button_widget.dart';
import 'package:gestao_eventos/presentation/global_widgets/default_padding_widget.dart';

class HeaderAreaWidget extends StatelessWidget {
  const HeaderAreaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultPaddingWidget(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              'Solicite o tipo de evento que voce deseja',
              softWrap: true,
              textAlign: TextAlign.left,
              maxLines: 3,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(width: kDefaultpadding),
          DefaultButton(),
        ],
      ),
    );
  }
}
