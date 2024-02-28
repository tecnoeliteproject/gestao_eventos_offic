import 'package:gestao_eventos/data/models/user_model.dart';
import 'package:gestao_eventos/data/repositories_interfaces/i_auth_repository.dart';
import 'package:gestao_eventos/domain/entities/user.dart';
import 'package:gestao_eventos/domain/usecases_interfaces/i_auth_uc.dart';

class AuthUC implements IAuthUC {
  AuthUC({required IAuthRepository repository}) : _repository = repository;

  final IAuthRepository _repository;
  @override
  Future<User> getCurrentUser() async {
    return UserModel.fromEntity((await _repository.getCurrentUser())!);
  }

  @override
  Future<bool> resetPassword(String email) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<User?> signIn(String email, String password) async {
    final res = await _repository.signIn(email, password);
    if (res == true) {
      return _repository.getUserByEmail(email);
    }
    return null;
  }

  @override
  Future<bool> signOut() async {
    return _repository.signOut();
  }

  @override
  Future<User> signUp(String email, String password) async {
    await _repository.signUp(email, password);
    return UserModel.toEntity(
      await _repository.createUser(UserModel(email: email, level: User.CLIENT)),
    );
  }

  @override
  Future<bool> updateEmail(String email) {
    // TODO: implement updateEmail
    throw UnimplementedError();
  }

  @override
  Future<bool> updatePassword(String password) async {
    throw UnimplementedError();
  }

  @override
  Future<List<User>> getAllUsers() async {
    return (await _repository.getAllUsers())
        .map((e) => UserModel.toEntity(UserModel.fromMap(e)))
        .toList();
  }

  @override
  Future<void> changeUserPermissionLevelEvent(String email, int level) async {
    await _repository.changeUserPermissionLevelEvent(email, level);
  }

  @override
  Future<bool> removeUser(User user) async {
    await removeAccountUser();
    return _repository.removeUser(UserModel.fromEntity(user));
  }

  Future<bool> removeAccountUser() {
    return _repository.removeAccountUser();
  }
}
