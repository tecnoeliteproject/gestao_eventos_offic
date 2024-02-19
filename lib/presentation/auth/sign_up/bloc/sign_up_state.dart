import 'package:gestao_eventos/domain/entities/permission_level.dart';
import 'package:gestao_eventos/domain/entities/user.dart';

abstract class SignUpState {}

class SignUpInitialState extends SignUpState {}
class SignUpSucess extends SignUpState {
  SignUpSucess({required this.user});

  final User user; 
}

class SignUpLoading extends SignUpState {}

class SigningUpError extends SignUpState {
  final String message;
  SigningUpError(this.message);
}