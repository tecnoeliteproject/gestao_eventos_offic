import 'package:gestao_eventos/domain/entities/permission_level.dart';
import 'package:gestao_eventos/domain/entities/user.dart';

abstract class SignInState {}

class SignInInitialState extends SignInState {}
class SignInSucess extends SignInState {
  SignInSucess({required this.user});

  final User user; 
}

class SignInLoading extends SignInState {}

class SigningInError extends SignInState {
  SigningInError(this.message);
  final String message;
}