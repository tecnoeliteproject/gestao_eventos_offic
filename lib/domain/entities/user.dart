
class User{
  User({
    this.email,
    this.password,
    this.id,
    this.name,
    this.level
  });
  
  String? email;
  int? level;
  String? password;
  String? id;
  String? name;
  
  static const int ADMIN = 0;
  static const int MANAGER = 1;
  static const int CLIENT = 2;
}