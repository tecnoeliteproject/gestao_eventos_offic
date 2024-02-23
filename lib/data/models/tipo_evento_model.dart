class TipoEventoModel {
  TipoEventoModel({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    this.images,
  });
  final String id;
  final String name;
  final String image;
  final String description;
  List<String>? images = [];
}
