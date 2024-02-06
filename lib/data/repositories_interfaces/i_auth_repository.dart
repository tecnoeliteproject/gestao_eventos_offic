abstract class IAuthRepository {
  Future<bool> signIn(String email, String password);
  Future<bool> signUp(String email, String password);
  Future<bool> signOut();
  Future<bool> resetPassword(String email);
  Future<bool> updatePassword(String password);
  Future<bool> updateEmail(String email);
  Future<String> getCurrentUser();
}