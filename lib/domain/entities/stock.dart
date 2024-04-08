import 'package:gestao_eventos/domain/entities/material_item.dart';

class Stock {
  Stock({
    required this.id,
    required this.material,
    required this.operacao,
    required this.data,
    this.motivo,
    this.obs,
    this.localizacao,
    this.usuarioResponsavelId,
    this.clienteId,
    this.condicao,
    this.fotoUrl,
  });

  final String id; // Identificador único do registo
  final MaterialItem material; // ID do material associado
  final String operacao; // Tipo de operação (entrada ou saída)
  final DateTime data; // Data da operação

  final String? motivo; // Motivo específico da operação (opcional)
  final String? obs; // Descrição detalhada do material
  final String? localizacao; // Local onde o material está armazenado
  final String? usuarioResponsavelId; // Pessoa responsável pela operação
  final String? clienteId; // cliente recepcionista
  final String? condicao; // Estado do material
  final String? fotoUrl;
}
