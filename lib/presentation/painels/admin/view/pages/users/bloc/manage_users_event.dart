import 'package:gestao_eventos/domain/entities/user.dart';

class ManageUsersEvent {}
class GetUsersEvent extends ManageUsersEvent{}
class SetUserAsAdminEvent extends ManageUsersEvent{}
class SetUserAsManagerEvent extends ManageUsersEvent{}
class SetUserAsClientEvent extends ManageUsersEvent{}
class MoreUserOptionEvent extends ManageUsersEvent{}
class RemoveUserEvent extends ManageUsersEvent{}
class ChangeUserPermissionLevelEvent extends ManageUsersEvent{
  ChangeUserPermissionLevelEvent({required this.users, required this.email, required this.level});

  final int level;
  final String email;
  final List<User> users;
}