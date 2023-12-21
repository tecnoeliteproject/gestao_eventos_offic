class Estoque {
  Estoque({
    required this.id,
    this.quantidade = 0,
    this.dataDeEntrada,
    this.dataDeSaida,
  });

  int id;
  int quantidade;
  DateTime? dataDeEntrada;
  DateTime? dataDeSaida;

  @override
  String toString() {
    return 'Estoque(quantidade: $quantidade, dataDeEntrada: $dataDeEntrada,'
        ' dataDeSaida: $dataDeSaida)';
  }
}
