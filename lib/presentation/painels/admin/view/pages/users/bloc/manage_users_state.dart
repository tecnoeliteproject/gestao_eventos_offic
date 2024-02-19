class ManageUsersState {}

class DownloadedUsersSucessState extends ManageUsersState {
  DownloadedUsersSucessState(this.users);
  final List users;}

class SignInLoading extends ManageUsersState {}

class SigningInError extends ManageUsersState {
  SigningInError(this.message);
  final String message;
}