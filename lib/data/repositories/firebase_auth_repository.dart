import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:gestao_eventos/core/error/auth_exceptions.dart';
import 'package:gestao_eventos/core/helpers/generic_functions.dart';
import 'package:gestao_eventos/data/repositories_interfaces/i_auth_repository.dart';

class FirebaseAuthRepository implements IAuthRepository {
  @override
  Future<bool> signIn(String email, String password) async {
    try {
      var res = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw AuthException(message: 'Nenhum usuário com este email!');
      } else if (e.code == 'wrong-password') {
        throw AuthException(message: 'Palavra-passe incorrecta!');
      }else if (e.code == 'invalid-email') {
        throw AuthException(
            message: 'Email inválido!');
      }else if (e.code == 'invalid-credential') {
        throw AuthException(
            message: 'Credenciais inválidas!');
      }
      showLog(messsage: e.code);
      showLog(messsage: e.message??'Erro ao fazer login');
      throw AuthException(message: 'Erro ao fazer login!');
    }
  }

  @override
  Future<String> getCurrentUser() {
    throw UnimplementedError();
  }

  @override
  Future<bool> resetPassword(String email) {
    throw UnimplementedError();
  }

  @override
  Future<bool> signOut() {
    throw UnimplementedError();
  }

  @override
  Future<bool> signUp(String email, String password) async {
    try {
      var data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw AuthException(message: 'Palavra-passe fraca!');
      } else if (e.code == 'email-already-in-use') {
        throw AuthException(
            message: 'Já existe uma conta com este email!');
      }else if (e.code == 'invalid-email') {
        throw AuthException(
            message: 'Email inválido!');
      }
      
      showLog(messsage: e.code);
      showLog(messsage: e.message??'Erro ao registrar o usuário');
      throw AuthException(message: e.message ?? 'Erro ao registrar o usuário');
    } catch (e) {
      showLog(messsage: e.toString());
      throw AuthException(message: e.toString());
    }
  }

  @override
  Future<bool> updateEmail(String email) {
    throw UnimplementedError();
  }

  @override
  Future<bool> updatePassword(String password) {
    throw UnimplementedError();
  }
}
