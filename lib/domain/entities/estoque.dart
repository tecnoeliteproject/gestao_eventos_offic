class Estoque {
  Estoque({
    this.quantidade = 0,
    this.dataDeEntrada,
    this.dataDeSaida,
  });

  int quantidade;
  DateTime? dataDeEntrada;
  DateTime? dataDeSaida;

  @override
  String toString() {
    return 'Estoque(quantidade: $quantidade, dataDeEntrada: $dataDeEntrada,'
        ' dataDeSaida: $dataDeSaida)';
  }
}
