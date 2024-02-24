<<<<<<< HEAD

abstract class SignInEvent {
}

class SigningInEvent extends SignInEvent {
  SigningInEvent({required this.email, required this.password});
  final String email;
  final String password;
}

class SigningOutEvent extends SignInEvent {}

=======

abstract class SignInEvent {
}

class SigningInEvent extends SignInEvent {
  SigningInEvent({required this.email, required this.password});
  final String email;
  final String password;
}

class SigningOutEvent extends SignInEvent {}

>>>>>>> 9c1fb90644301fea5aadcc0ac7058a394f50e020
