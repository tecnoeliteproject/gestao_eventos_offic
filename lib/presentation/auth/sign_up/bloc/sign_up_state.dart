abstract class SignUpState {}

class SignUpInitialState extends SignUpState {}
class SignUpSucess extends SignUpState {
}

class SignUpLoading extends SignUpState {}

class SignUpError extends SignUpState {
  final String message;
  SignUpError(this.message);
}