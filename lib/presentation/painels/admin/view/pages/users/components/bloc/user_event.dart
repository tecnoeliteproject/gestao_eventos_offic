part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class ChangeUserPermissionLevelEvent extends UserEvent{
  ChangeUserPermissionLevelEvent({required this.user, required this.email, required this.level});

  final int level;
  final String email;
  final User user;
}