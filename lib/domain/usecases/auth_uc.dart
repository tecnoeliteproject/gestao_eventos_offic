import 'package:gestao_eventos/core/error/auth_exceptions.dart';
import 'package:gestao_eventos/core/helpers/generic_functions.dart';
import 'package:gestao_eventos/data/models/user_model.dart';
import 'package:gestao_eventos/data/repositories_interfaces/i_auth_repository.dart';
import 'package:gestao_eventos/domain/entities/permission_level.dart';
import 'package:gestao_eventos/domain/entities/user.dart';
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
  Future<User?> signIn(String email, String password) async{
    final res = await _repository.signIn(email, password);
    if (res == true){ 
      return _repository.getUserByEmail(email);
    }
    return null;
  }

  @override
  Future<bool> signOut() async{
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<User> signUp(String email, String password) async{
    final res = await _repository.signUp(email, password);
    return UserModel.toEntity(await _repository.createUser(UserModel(email: email, level: User.CLIENT)));
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