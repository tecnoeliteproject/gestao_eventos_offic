
class SignInEvent {
  SignInEvent({required this.onSucess,required this.email, required this.password});
  final String email;
  final String password;
  final Function() onSucess;
}

