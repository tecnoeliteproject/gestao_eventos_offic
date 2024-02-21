import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestao_eventos/data/repositories/firebase_auth_repository.dart';
import 'package:gestao_eventos/domain/usecases/auth_uc.dart';
import 'package:gestao_eventos/domain/usecases_interfaces/i_auth_uc.dart';
import 'package:gestao_eventos/presentation/painels/admin/view/pages/users/bloc/manage_users_event.dart';
import 'package:gestao_eventos/presentation/painels/admin/view/pages/users/bloc/manage_users_state.dart';

class ManageUsersBloc extends Bloc<ManageUsersEvent, ManageUsersState> {
  ManageUsersBloc(super.initialState){
    initAllDependencies();
    initAllEvents();
  }
  
  void initAllEvents() {
    on<GetUsersEvent>((event, emit)async{
      final res = await _authUC.getAllUsers();
      emit(DownloadedUsersState(res));
    });
    
    
    // on<GetUsersEvent>((event, emit)async{
    //   final res = await _authUC.getAllUsers();
    //   emit(DownloadedUsersState(res));
    // });
    
    on<ChangeUserPermissionLevelEvent>((event, emit)async{
      await _authUC.changeUserPermissionLevelEvent(event.email, event.level);
      emit(ChangeUserPermissionLevelState(email: event.email, level: event.level, users: event.users, ));
    });
  }
  
  void initAllDependencies() {
    _authUC = AuthUC(repository: FirebaseAuthRepository());
  }

  late IAuthUC _authUC;
  
}