import 'package:gestao_eventos/domain/entities/user.dart';

class ManageUsersEvent {}
class GetUsersEvent extends ManageUsersEvent{}
class SetUserAsAdminEvent extends ManageUsersEvent{}
class SetUserAsManagerEvent extends ManageUsersEvent{}
class SetUserAsClientEvent extends ManageUsersEvent{}
class MoreUserOptionEvent extends ManageUsersEvent{}
class RemoveUserEvent extends ManageUsersEvent{
  RemoveUserEvent({required this.user, required this.users});

  final List<User> users;
  final User user;
}