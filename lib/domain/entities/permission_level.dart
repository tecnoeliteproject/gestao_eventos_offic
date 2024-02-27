class PermissionLevel {
  PermissionLevel({required this.level, required this.usersEmail});
  final int level;
  final List<dynamic> usersEmail;
  static const int ADMIN = 0;
  static const int RECEPCIONISTA = 1;
  static const int CLIENT = 2;
}