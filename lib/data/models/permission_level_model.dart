import 'package:gestao_eventos/core/helpers/generic_functions.dart';
import 'package:gestao_eventos/domain/entities/permission_level.dart';

class PermissionLevelModel extends PermissionLevel {

  PermissionLevelModel({
    required this.level,
    required this.usersEmail,
  }) : super(level: level, usersEmail: usersEmail);

  factory PermissionLevelModel.fromEntity(PermissionLevel entity) {
    return PermissionLevelModel(
      level: entity.level,
      usersEmail: entity.usersEmail,
    );
  }

  PermissionLevel toEntity(PermissionLevelModel model) {
    return PermissionLevelModel(
      level: model.level,
      usersEmail: model.usersEmail,
    );
  }

  factory PermissionLevelModel.fromMap(Map<String, dynamic> map) {
    return PermissionLevelModel(
      level: map[LEVEL] as int,
      usersEmail: map[USER_EMAILS] as List,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      LEVEL: level,
      USER_EMAILS: usersEmail,
    };
  }

  @override
  final int level;
  @override
  final List<dynamic> usersEmail;

  static const String LEVEL  = 'level';
  static const String USER_EMAILS  = 'user_emails';
}