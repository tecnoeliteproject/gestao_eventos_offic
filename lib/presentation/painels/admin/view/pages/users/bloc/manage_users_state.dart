import 'package:gestao_eventos/domain/entities/user.dart';

class ManageUsersState {}

class DownloadedUsersState extends ManageUsersState {
  DownloadedUsersState(this.users);
  final List<User> users;}

class GettingUsersState extends ManageUsersState {}
class EmptyUsersListState extends ManageUsersState {}

class GetUsersInError extends ManageUsersState {
  GetUsersInError(this.message);
  final String message;
}

class ChangeUserPermissionLevelState extends ManageUsersState {
  ChangeUserPermissionLevelState({required this.users, required this.level, required this.email});
  final int level;
  final String email;
  final List<User> users;
}