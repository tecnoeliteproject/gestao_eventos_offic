import 'package:gestao_eventos/domain/entities/user.dart';

abstract class IAuthUC {
  Future<User?> signIn(String email, String password);
  Future<User> signUp(String name,String email, String password);
  Future<bool> signOut();
  Future<bool> removeUser(User user);
  Future<bool> resetPassword(String email);
  Future<bool> updatePassword(String password);
  Future<bool> updateEmail(String email);
  Future<User?> getCurrentUser();
  Future<List<User>> getAllUsers();
  
  Future<void> changeUserPermissionLevelEvent(String email, int level);

  Future<User?> getUserByEmail(String email);
}