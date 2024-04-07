abstract class AdminEvent{}
class AdminGetAllUsersEvent extends AdminEvent {}
class ChangeAdminPageEvent extends AdminEvent {
  ChangeAdminPageEvent({this.data, required this.index});
  dynamic data;
  final int index;
}