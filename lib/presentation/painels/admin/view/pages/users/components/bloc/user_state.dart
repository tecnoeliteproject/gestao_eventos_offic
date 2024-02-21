part of 'user_bloc.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {}

class LoadingState extends UserState {
  LoadingState({required this.userAtributeType});

  final UserAtributeType userAtributeType;
}

class ChangeUserPermissionLevelState extends UserState {
  ChangeUserPermissionLevelState(
      {required this.user, required this.level, required this.email});
  final int level;
  final String email;
  final User user;
}

enum UserAtributeType { LEVEL, EMAIL }
