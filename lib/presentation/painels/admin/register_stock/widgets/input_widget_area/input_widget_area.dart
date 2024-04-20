import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:gestao_eventos/core/helpers/constants.dart';
import 'package:gestao_eventos/domain/entities/material_item.dart';
import 'package:gestao_eventos/presentation/painels/admin/register_stock/widgets/input_widget_area/material_selector_widget.dart';
import 'package:uuid/uuid.dart';

/*
  final Material material; // ID do material associado
    final String nome;
    final String descricao;
    final int quantidade;
    final double precoUnitario;
  final String operacao; // Tipo de operação (entrada ou saída)
  final DateTime data; // Data da operação

  final String? motivo; // Motivo específico da operação (opcional)
  final String? obs; // Descrição detalhada do material
  final String? localizacao; // Local onde o material está armazenado
  final String? usuarioResponsavelId; // Pessoa responsável pela operação
  final String? clienteId; // cliente recepcionista
  final String? condicao; // Estado do material
  final String? fotoUrl;
*/

class InputWidgetArea extends StatelessWidget {
  const InputWidgetArea({super.key});

  @override
  Widget build(BuildContext context) {
    MaterialItem createFakeMaterialEntity() {
      return MaterialItem(
        id: const Uuid().v4(),
        nome: faker.vehicle.model(),
        descricao: faker.vehicle.make(),
        quantidade: 5,
        precoUnitario: 0,
      );
    }

    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding / 2),
      child: Column(
        children: [
          MaterialSelectorWidget(
            title: 'Materiais',
            placeHolder: 'Selecione o material',
            materiais: List.generate(
              90,
              (index) => createFakeMaterialEntity(),
            ).toList(),
          ),
          const GutterSmall(),
          MaterialSelectorWidget(
            title: 'Clientes',
            placeHolder: 'Selecione o cliente',
            materiais: List.generate(
              90,
              (index) => createFakeMaterialEntity(),
            ).toList(),
          ),
          const GutterSmall(),
          const InputWidgetArea(),
        ],
      ),
    );
  }
}
