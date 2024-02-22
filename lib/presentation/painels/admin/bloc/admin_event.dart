abstract class AdminEvent{}
class AdminGetAllUsersEvent extends AdminEvent {}
class ChangeAdminPageEvent extends AdminEvent {
  ChangeAdminPageEvent({required this.index});

  final int index;
}