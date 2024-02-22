
abstract class SignInEvent {
}

class SigningInEvent extends SignInEvent {
  SigningInEvent({required this.email, required this.password});
  final String email;
  final String password;
}

class SigningOutEvent extends SignInEvent {}

