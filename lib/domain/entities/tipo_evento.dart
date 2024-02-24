class TipoEvento {
  TipoEvento({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.exemplos,
  });

  final String id;
  final String name;
  final String image;
  final String description;
  List<String> exemplos;
}
