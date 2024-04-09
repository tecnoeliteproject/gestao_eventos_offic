import 'package:flutter/material.dart';
import 'package:gestao_eventos/core/helpers/constants.dart';

class TipoOperacaoWidget extends StatelessWidget {
  const TipoOperacaoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding / 2),
      child: DropdownButtonFormField(
        items: const [
          DropdownMenuItem(
            value: 'Entrada',
            child: Text('Entrada'),
          ),
          DropdownMenuItem(
            value: 'Saida',
            child: Text('Saida'),
          ),
        ],
        onChanged: print,
        decoration: const InputDecoration(
          labelText: 'Tipo de Operação',
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null) {
            return 'Selecione o tipo de operação';
          }
          return null;
        },
      ),
    );
  }
}
