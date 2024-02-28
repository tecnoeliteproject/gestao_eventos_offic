import 'package:gestao_eventos/data/models/user_model.dart';

abstract class IAuthRepository {
  Future<bool> signIn(String email, String password);
  Future<bool> signUp(String email, String password);
  Future<bool> signOut();
  Future<bool> resetPassword(String email);
  Future<bool> updatePassword(String password);
  Future<bool> updateEmail(String email);
  Future<UserModel?> getCurrentUser();
  Future<List<Map<String, dynamic>>> getAllUsers();

  Future<UserModel?> getUserByEmail(String email);
  Future<UserModel> createUser(UserModel model);

  Future<void> changeUserPermissionLevelEvent(String email, int level);

  Future<bool> removeUser(UserModel userModel);
  Future<bool> removeAccountUser();
}
