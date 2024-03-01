<<<<<<< HEAD
<<<<<<< HEAD
import 'package:gestao_eventos/domain/entities/user.dart';

abstract class IAuthUC {
  Future<User?> signIn(String email, String password);
  Future<User> signUp(String email, String password);
  Future<bool> signOut();
  Future<bool> removeUser(User user);
  Future<bool> resetPassword(String email);
  Future<bool> updatePassword(String password);
  Future<bool> updateEmail(String email);
  Future<String> getCurrentUser();
  Future<List<User>> getAllUsers();
  
  Future<void> changeUserPermissionLevelEvent(String email, int level);
=======
import 'package:gestao_eventos/domain/entities/user.dart';

abstract class IAuthUC {
  Future<User?> signIn(String email, String password);
  Future<User> signUp(String email, String password);
  Future<bool> signOut();
  Future<bool> removeUser(User user);
  Future<bool> resetPassword(String email);
  Future<bool> updatePassword(String password);
  Future<bool> updateEmail(String email);
  Future<String> getCurrentUser();
  Future<List<User>> getAllUsers();
  
  Future<void> changeUserPermissionLevelEvent(String email, int level);
>>>>>>> 9c1fb90644301fea5aadcc0ac7058a394f50e020
=======
import 'package:gestao_eventos/domain/entities/user.dart';

abstract class IAuthUC {
  Future<User?> signIn(String email, String password);
  Future<User> signUp(String email, String password);
  Future<bool> signOut();
  Future<bool> removeUser(User user);
  Future<bool> resetPassword(String email);
  Future<bool> updatePassword(String password);
  Future<bool> updateEmail(String email);
  Future<User?> getCurrentUser();
  Future<List<User>> getAllUsers();
  
  Future<void> changeUserPermissionLevelEvent(String email, int level);
>>>>>>> origin/GDE-19-Adicionar-a-pagina/aba-chat-no-painel-gerente
}