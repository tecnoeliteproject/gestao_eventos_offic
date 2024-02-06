abstract class SignInState {}

class SignInInitialState extends SignInState {}
class SignInSucess extends SignInState {
}

class SignInLoading extends SignInState {}

class SignInError extends SignInState {
  SignInError(this.message);
  final String message;
}