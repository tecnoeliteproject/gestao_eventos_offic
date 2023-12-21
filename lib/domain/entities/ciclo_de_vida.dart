class CicloDeVida {
  CicloDeVida({
    required this.dataDeLancamento,
    this.dataDeDescontinuacao,
    this.motivoDaDescontinuacao = '',
  });

  DateTime dataDeLancamento;
  DateTime? dataDeDescontinuacao;
  String? motivoDaDescontinuacao;

  @override
  String toString() {
    return 'CicloDeVida(dataDeLancamento: $dataDeLancamento, '
        'dataDeDescontinuacao: $dataDeDescontinuacao,'
        ' motivoDaDescontinuacao: $motivoDaDescontinuacao)';
  }
}
