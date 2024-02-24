<<<<<<< HEAD
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestao_eventos/data/repositories/firebase_auth_repository.dart';
import 'package:gestao_eventos/domain/usecases/auth_uc.dart';
import 'package:gestao_eventos/domain/usecases_interfaces/i_auth_uc.dart';
import 'package:gestao_eventos/presentation/painels/admin/view/pages/users/bloc/manage_users_event.dart';
import 'package:gestao_eventos/presentation/painels/admin/view/pages/users/bloc/manage_users_state.dart';

class ManageUsersBloc extends Bloc<ManageUsersEvent, ManageUsersState> {
  ManageUsersBloc(super.initialState){
    _initAllDependencies();
    _initAllEvents();
  }
  
  void _initAllEvents() {
    on<GetUsersEvent>((event, emit)async{
      await _getAllUsers(emit);
    });
    
    on<RemoveUserEvent>((event, emit)async{
      await _removeUser(event, emit);
    });
  }

  Future<void> _getAllUsers(Emitter<ManageUsersState> emit) async {
    emit(GettingUsersState());
    final res = await _authUC.getAllUsers();
    emit(DownloadedUsersState(res));
  }
  
  Future<void> _removeUser(RemoveUserEvent event, Emitter<ManageUsersState> emit) async {
    emit(RemovingUserState(users: event.users));
    await _authUC.removeUser(event.user);
    event.users.removeWhere((element) => element.email == event.user.email,);
    emit(RemovedUserState(users: event.users));
  }
  
  void _initAllDependencies() {
    _authUC = AuthUC(repository: FirebaseAuthRepository());
  }

  late IAuthUC _authUC;
  
=======
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestao_eventos/data/repositories/firebase_auth_repository.dart';
import 'package:gestao_eventos/domain/usecases/auth_uc.dart';
import 'package:gestao_eventos/domain/usecases_interfaces/i_auth_uc.dart';
import 'package:gestao_eventos/presentation/painels/admin/view/pages/users/bloc/manage_users_event.dart';
import 'package:gestao_eventos/presentation/painels/admin/view/pages/users/bloc/manage_users_state.dart';

class ManageUsersBloc extends Bloc<ManageUsersEvent, ManageUsersState> {
  ManageUsersBloc(super.initialState){
    _initAllDependencies();
    _initAllEvents();
  }
  
  void _initAllEvents() {
    on<GetUsersEvent>((event, emit)async{
      await _getAllUsers(emit);
    });
    
    on<RemoveUserEvent>((event, emit)async{
      await _removeUser(event, emit);
    });
  }

  Future<void> _getAllUsers(Emitter<ManageUsersState> emit) async {
    emit(GettingUsersState());
    final res = await _authUC.getAllUsers();
    emit(DownloadedUsersState(res));
  }
  
  Future<void> _removeUser(RemoveUserEvent event, Emitter<ManageUsersState> emit) async {
    emit(RemovingUserState(users: event.users));
    await _authUC.removeUser(event.user);
    event.users.removeWhere((element) => element.email == event.user.email,);
    emit(RemovedUserState(users: event.users));
  }
  
  void _initAllDependencies() {
    _authUC = AuthUC(repository: FirebaseAuthRepository());
  }

  late IAuthUC _authUC;
  
>>>>>>> 9c1fb90644301fea5aadcc0ac7058a394f50e020
}