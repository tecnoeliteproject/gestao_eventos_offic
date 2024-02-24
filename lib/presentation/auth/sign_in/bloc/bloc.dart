import 'package:bloc/bloc.dart';
import 'package:gestao_eventos/core/error/auth_exceptions.dart';
import 'package:gestao_eventos/data/repositories/firebase_auth_repository.dart';
import 'package:gestao_eventos/domain/usecases/auth_uc.dart';
import 'package:gestao_eventos/domain/usecases_interfaces/i_auth_uc.dart';
import 'package:gestao_eventos/presentation/auth/sign_in/bloc/sign_in_event.dart';
import 'package:gestao_eventos/presentation/auth/sign_in/bloc/sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc(SignInInitialState initialState) : super(initialState) {
    initDependencies();
    initAllEvents();
  }

  void initAllEvents() {
    on<SigningInEvent>(
      (event, emit) async{
        await _signin(emit, event);
      },
    );
    
    on<SigningOutEvent>(
      (event, emit) async{
        await _signOut(emit, event);
      },
    );
  }

  late IAuthUC _uc;

  Future<void> _signOut(Emitter<SignInState> emit, SigningOutEvent event) async {
    await _uc.signOut();
    emit(SigningOutState());
  }
  Future<void> _signin(Emitter<SignInState> emit, SigningInEvent event) async {
    emit(SigningInState());
    try {
      var user = await _uc.signIn(event.email, event.password);
      if (user != null) {
        emit(SignInSucess(user: user));
      }
    } on AuthException catch (e) {
      emit(SigningInError(e.message));
    }
  }

  void initDependencies() {
    _uc = AuthUC(repository: FirebaseAuthRepository());
  }
}
