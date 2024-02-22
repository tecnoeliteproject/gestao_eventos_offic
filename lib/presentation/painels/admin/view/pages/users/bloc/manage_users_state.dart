import 'package:gestao_eventos/domain/entities/user.dart';

class ManageUsersState {}

class DownloadedUsersState extends ManageUsersState {
  DownloadedUsersState(this.users);
  final List<User> users;}

class GettingUsersState extends ManageUsersState {}
class RemovingUserState extends ManageUsersState {
  RemovingUserState({required this.users});

  final List<User> users;}
class EmptyUsersListState extends ManageUsersState {}
class RemovedUserState extends ManageUsersState {
  RemovedUserState({required this.users});

  final List<User> users;
}

class GetUsersInError extends ManageUsersState {
  GetUsersInError(this.message);
  final String message;
}