class Imagem {
  Imagem({
    required this.id,
    this.nome = '',
    this.caminho = '',
  });

int id;
  String nome;
  String caminho;

  @override
  String toString() {
    return 'Imagem(nome: $nome, caminho: $caminho)';
  }
}
