import 'package:gestao_eventos/domain/entities/user.dart';

abstract class AdminState {}
class AdminInitialState extends AdminState {}
class EmptyUserListState extends AdminState {}
class ErrorOnGetUserState extends AdminState {}
class UserLoadedState extends AdminState {}
class ChangeAdminPageState extends AdminState {
  dynamic data;
  ChangeAdminPageState({this.data});
}
final class GotoChatPageState extends AdminState {
  GotoChatPageState({required this.user});
  final User user;
}