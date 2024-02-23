import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestao_eventos/presentation/painels/admin/bloc/admin_event.dart';
import 'package:gestao_eventos/presentation/painels/admin/bloc/admin_state.dart';

class AdminBloc extends Bloc<AdminEvent, AdminState> {
  AdminBloc(AdminInitialState super.state) {
    initAllEvents();
  }

  void initAllEvents() {
    on<AdminGetAllUsersEvent>((event, emit) async {});
    on<ChangeAdminPageEvent>((event, emit) {
      _gotoPage(event.index);
      emit(ChangeAdminPageState());
    });
  }

  // ignore: use_setters_to_change_properties
  void _gotoPage(int index) => pageIndex = index;
  int pageIndex = 0;
}
