// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: inference_failure_on_instance_creation

import 'package:flutter/material.dart';
import 'package:flutter_awesome_select/flutter_awesome_select.dart';
import 'package:gestao_eventos/core/helpers/constants.dart';
import 'package:gestao_eventos/domain/entities/material_item.dart';

class MaterialSelectorWidget extends StatefulWidget {
  const MaterialSelectorWidget({
    required this.title,
    required this.placeHolder,
    required this.materiais,
    super.key,
  });

  final String title;
  final String placeHolder;
  final List<MaterialItem> materiais;

  @override
  State<MaterialSelectorWidget> createState() => _MaterialSelectorWidgetState();
}

class _MaterialSelectorWidgetState extends State<MaterialSelectorWidget> {
  late final List<S2Choice<String>> options;
  late String value;

  @override
  void initState() {
    value = widget.materiais.first.nome;
    options = widget.materiais
        .map(
          (e) => S2Choice<String>(
            value: e.id,
            title: e.nome,
            subtitle: e.descricao,
          ),
        )
        .toList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding / 2),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).primaryColor,
            ),
            borderRadius: BorderRadius.circular(6),
          ),
          child: SmartSelect<String>.single(
            selectedValue: value,
            placeholder: widget.placeHolder,
            choiceDivider: true,
            choiceEmptyBuilder: (context, value) {
              return const Center(
                child: Text('Nenhum material encontrado'),
              );
            },
            modalConfig: S2ModalConfig(
              useFilter: true,
              filterHint: 'Pesquisar',
              title: widget.title,
              headerStyle: S2ModalHeaderStyle(
                textStyle: TextStyle(
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                ),
              ),
            ),
            modalFilter: true,
            modalFilterAuto: true,
            choiceItems: options,
            onChange: (state) => print,
            tileBuilder: (context, value) {
              return S2Tile.fromState(
                value,
                isTwoLine: true,
              );
            },
          ),
        ),
      ),
    );
  }
}
