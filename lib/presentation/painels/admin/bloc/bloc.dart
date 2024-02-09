import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestao_eventos/presentation/painels/admin/bloc/admin_event.dart';
import 'package:gestao_eventos/presentation/painels/admin/bloc/admin_state.dart';

class AdminBloc extends Bloc<AdminEvent, AdminState> {
  AdminBloc(AdminInitialState state) : super(state) {
    on<AdminGetAllUsersEvent>((event, emit) {

    });
  }

  

  void gotoPage(int index)=> pageIndex = index;
  int pageIndex = 0;
}