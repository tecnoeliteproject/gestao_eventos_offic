class Categoria {
  Categoria({
    required this.id,
    this.nome = '',
    this.descricao = '',
  });

  int id;
  String nome;
  String descricao;

  @override
  String toString() {
    return 'Categoria(nome: $nome, descricao: $descricao)';
  }
}
