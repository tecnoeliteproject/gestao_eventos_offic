import 'package:gestao_eventos/domain/entities/user.dart';

abstract class SignInState {}

class SignInInitialState extends SignInState {}
class SignInSucess extends SignInState {
  SignInSucess({required this.user});

  final User user; 
}

class SigningInState extends SignInState {}
class SigningOutState extends SignInState {}

class SigningInError extends SignInState {
  SigningInError(this.message);
  final String message;
}