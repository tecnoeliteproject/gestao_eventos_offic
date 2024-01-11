abstract class SignInState {}

class InitialState extends SignInState {}
class SignInSucess extends SignInState {
}

class SignInLoading extends SignInState {}

class SignInError extends SignInState {
  final String message;
  SignInError(this.message);
}