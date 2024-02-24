<<<<<<< HEAD
abstract class AdminEvent{}
class AdminGetAllUsersEvent extends AdminEvent {}
class ChangeAdminPageEvent extends AdminEvent {
  ChangeAdminPageEvent({required this.index});

  final int index;
=======
abstract class AdminEvent{}
class AdminGetAllUsersEvent extends AdminEvent {}
class ChangeAdminPageEvent extends AdminEvent {
  ChangeAdminPageEvent({required this.index});

  final int index;
>>>>>>> 9c1fb90644301fea5aadcc0ac7058a394f50e020
}