import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestao_eventos/data/repositories/firebase_auth_repository.dart';
import 'package:gestao_eventos/domain/usecases/auth_uc.dart';
import 'package:gestao_eventos/domain/usecases_interfaces/i_auth_uc.dart';
import 'package:gestao_eventos/presentation/painels/admin/bloc/admin_event.dart';
import 'package:gestao_eventos/presentation/painels/admin/bloc/admin_state.dart';
import 'package:gestao_eventos/presentation/painels/admin/view/pages/users/bloc/manage_users_state.dart';

class AdminBloc extends Bloc<AdminEvent, AdminState> {
  AdminBloc(AdminInitialState state) : super(state) {
    initAllEvents();
  }

  void initAllEvents() {
    on<AdminGetAllUsersEvent>((event, emit) async{
    });
    on<ChangeAdminPageEvent>((event, emit) {
      _gotoPage(event.index);
      emit(ChangeAdminPageState());
    });
  }

  void _gotoPage(int index)=> pageIndex = index;
  int pageIndex = 0;
}