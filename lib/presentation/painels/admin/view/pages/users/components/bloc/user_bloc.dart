import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gestao_eventos/data/repositories/firebase_auth_repository.dart';
import 'package:gestao_eventos/domain/entities/user.dart';
import 'package:gestao_eventos/domain/usecases/auth_uc.dart';
import 'package:gestao_eventos/domain/usecases_interfaces/i_auth_uc.dart';
import 'package:gestao_eventos/presentation/painels/admin/view/pages/users/bloc/manage_users_event.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc(UserInitial userInitial) : super(UserInitial()) {
    _initAllDependencies();
    _initAllEvents();
  }

  void _initAllEvents() {
    on<ChangeUserPermissionLevelEvent>((event, emit)async{
      await _changeUserPermissionLevel(event, emit);
    });
  }

  Future<void> _changeUserPermissionLevel(ChangeUserPermissionLevelEvent  event, Emitter<UserState> emit,) async {
    emit(LoadingState(userAtributeType: UserAtributeType.LEVEL));
    await _authUC.changeUserPermissionLevelEvent(event.email, event.level);
    event.user.level = event.level;
    emit(ChangeUserPermissionLevelState(user: event.user, level: event.level, email: event.email));
  }

  void _initAllDependencies() {
    _authUC = AuthUC(repository: FirebaseAuthRepository());
  }

  late IAuthUC _authUC;
}
