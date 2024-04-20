// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: inference_failure_on_instance_creation

import 'package:flutter/material.dart';
import 'package:flutter_awesome_select/flutter_awesome_select.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gestao_eventos/core/helpers/constants.dart';
import 'package:gestao_eventos/domain/entities/material_item.dart';
import 'package:gestao_eventos/presentation/painels/admin/register_stock/cubit/material_selector_cubit.dart';

class MaterialSelectorWidget extends HookWidget {
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
  Widget build(BuildContext context) {
    final valueState = useState('');

    return BlocBuilder(
      bloc: context.read<MaterialSelectorCubit>()..getAllMaterials(),
      builder: (c, state) {
        if (state is MaterialSelectorLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is MaterialSelectorError) {
          return const Center(
            child: Text('Ocorreu um erro ao carregar a lista de materiais'),
          );
        }

        if (state is MaterialSelectorLoaded) {
          final materiais = state.materials;

          return _buildInputField(
            context,
            materiais
                .map(
                  (e) => S2Choice<String>(
                    value: e.id,
                    title: e.nome,
                    subtitle: e.descricao,
                  ),
                )
                .toList(),
            valueState,
          );
        }

        return const SizedBox();
      },
    );
  }

  Widget _buildInputField(
    BuildContext context,
    List<S2Choice<String>> options,
    ValueNotifier<String> materialState,
  ) {
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
            selectedValue: materialState.value,
            placeholder: placeHolder,
            choiceDivider: true,
            choiceEmptyBuilder: (context, value) {
              return const Center(
                child: Text('Nenhum material encontrado'),
              );
            },
            modalConfig: S2ModalConfig(
              useFilter: true,
              filterHint: 'Pesquisar',
              title: 'Materiais',
              headerStyle: S2ModalHeaderStyle(
                textStyle: TextStyle(
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                ),
              ),
            ),
            modalFilter: true,
            modalFilterAuto: true,
            choiceItems: options,
            onChange: (state) {
              materialState.value = state.value;
            },
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
