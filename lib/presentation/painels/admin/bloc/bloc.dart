import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestao_eventos/domain/entities/user.dart';
import 'package:gestao_eventos/presentation/painels/admin/bloc/admin_event.dart';
import 'package:gestao_eventos/presentation/painels/admin/bloc/admin_state.dart';

class AdminBloc extends Bloc<AdminEvent, AdminState> {
  AdminBloc(AdminInitialState super.state) {
    initAllEvents();
  }

  void initAllEvents() {
    on<AdminGetAllUsersEvent>((event, emit) async {});
    on<ChangeAdminPageEvent>((event, emit) {
      if (event.data == null) {
        _gotoPage(event.index);
      }else{
        emit(GotoChatPageState(user: event.data as User));
        return;
      }
      emit(ChangeAdminPageState(data: event.data));
    });
  }

  void _gotoPage(int index) => pageIndex = index;
  int pageIndex = 0;
  User? userSender;
}
