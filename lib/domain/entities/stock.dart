class Stock {
  Stock({
    required this.id,
    required this.materialId,
    required this.operacao,
    required this.precoUnitario,
    required this.quantidade,
    required this.data,
    this.motivo,
    this.descricaoMaterial,
    this.localizacao,
    this.usuarioResponsavel,
    this.condicao,
    this.fotoUrl,
  });

  final String id; // Identificador único do registo
  final String materialId; // ID do material associado
  final String operacao; // Tipo de operação (entrada ou saída)
  final double precoUnitario; // Preço unitário ou por lote
  final int quantidade; // Quantidade movimentada
  final DateTime data; // Data da operação

  final String? motivo; // Motivo específico da operação (opcional)
  final String? descricaoMaterial; // Descrição detalhada do material
  final String? localizacao; // Local onde o material está armazenado
  final String? usuarioResponsavel; // Pessoa responsável pela operação
  final String? condicao; // Estado do material
  final String? fotoUrl;
}
