<<<<<<< HEAD
import 'package:gestao_eventos/domain/entities/user.dart';

class UserModel extends User {
  UserModel({this.email, this.password, this.id, this.name, this.level});

  factory UserModel.fromEntity(User entity) {
    return UserModel(
        email: entity.email,
        level: entity.level,
        password: entity.password,
        id: entity.id,
        name: entity.name);
  }

  factory UserModel.toEntity(UserModel model) {
    return UserModel(
        email: model.email,
        level: model.level,
        password: model.password,
        id: model.id,
        name: model.name);
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        email: (map['email'] ?? '') as String,
        level: (map['level'] ?? '') as int,
        password: (map['password'] ?? '') as String,
        id: (map['id'] ?? '') as String,
        name: (map['name'] ?? '') as String);
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'level': level,
      'password': password,
      'id': id,
      'name': name
    };
  }

  static int NIVEL_ADMIN = 0;
  static int NIVEL_GERENTE = 1;
  static int NIVEL_CLIENTE = 2;

  static String nivelToText(int nivel) {
    if (nivel == NIVEL_ADMIN) {
      return 'Adminstrador';
    }
    if (nivel == NIVEL_GERENTE) {
      return 'Gerente';
    }
    return 'Cliente';
  }
  
  static int textToNivel(String text) {
    if (text == 'Adminstrador') {
      return NIVEL_ADMIN;
    }
    if (text == 'Gerente') {
      return NIVEL_GERENTE;
    }
    return NIVEL_CLIENTE;
  }

  @override
  String? email;
  @override
  int? level;
  @override
  String? password;
  @override
  String? id;
  @override
  String? name;
}
=======
import 'package:gestao_eventos/domain/entities/user.dart';

class UserModel extends User {
  UserModel({this.email, this.password, this.id, this.name, this.level});

  factory UserModel.fromEntity(User entity) {
    return UserModel(
        email: entity.email,
        level: entity.level,
        password: entity.password,
        id: entity.id,
        name: entity.name);
  }

  factory UserModel.toEntity(UserModel model) {
    return UserModel(
        email: model.email,
        level: model.level,
        password: model.password,
        id: model.id,
        name: model.name);
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        email: (map['email'] ?? '') as String,
        level: (map['level'] ?? '') as int,
        password: (map['password'] ?? '') as String,
        id: (map['id'] ?? '') as String,
        name: (map['name'] ?? '') as String);
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'level': level,
      'password': password,
      'id': id,
      'name': name
    };
  }

  static int NIVEL_ADMIN = 0;
  static int NIVEL_GERENTE = 1;
  static int NIVEL_CLIENTE = 2;

  static String nivelToText(int nivel) {
    if (nivel == NIVEL_ADMIN) {
      return 'Adminstrador';
    }
    if (nivel == NIVEL_GERENTE) {
      return 'Gerente';
    }
    return 'Cliente';
  }
  
  static int textToNivel(String text) {
    if (text == 'Adminstrador') {
      return NIVEL_ADMIN;
    }
    if (text == 'Gerente') {
      return NIVEL_GERENTE;
    }
    return NIVEL_CLIENTE;
  }

  @override
  String? email;
  @override
  int? level;
  @override
  String? password;
  @override
  String? id;
  @override
  String? name;
}
>>>>>>> 9c1fb90644301fea5aadcc0ac7058a394f50e020
