import 'package:gestao_eventos/data/repositories_interfaces/i_auth_repository.dart';
import 'package:gestao_eventos/domain/usecases_interfaces/i_auth_uc.dart';

class AuthUC implements IAuthUC {
  AuthUC({required IAuthRepository repository}) : _repository = repository;

  final IAuthRepository _repository;
  @override
  Future<String> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<bool> resetPassword(String email) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<bool> signIn(String email, String password) async{
    return _repository.signIn(email, password);
  }

  @override
  Future<bool> signOut() async{
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<bool> signUp(String email, String password) async{
    return _repository.signUp(email, password);
  }

  @override
  Future<bool> updateEmail(String email) {
    // TODO: implement updateEmail
    throw UnimplementedError();
  }

  @override
  Future<bool> updatePassword(String password) {
    // TODO: implement updatePassword
    throw UnimplementedError();
  }
  
}