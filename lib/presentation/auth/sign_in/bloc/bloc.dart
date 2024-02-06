import 'package:bloc/bloc.dart';
import 'package:gestao_eventos/core/error/auth_exceptions.dart';
import 'package:gestao_eventos/data/repositories/firebase_auth_repository.dart';
import 'package:gestao_eventos/domain/usecases/auth_uc.dart';
import 'package:gestao_eventos/presentation/auth/sign_in/bloc/sign_in_event.dart';
import 'package:gestao_eventos/presentation/auth/sign_in/bloc/sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc(SignInInitialState initialState) : super(initialState) {
    initDependencies();
    on<SignInEvent>(
      (event, emit) async{
        await _signin(emit, event);
      },
    );
  }

  late AuthUC _uc;

  Future<void> _signin(Emitter<SignInState> emit, SignInEvent event) async {
    emit(SignInLoading());
    try {
      if ((await _uc.signIn(event.email, event.password)) == true) {
        emit(SignInSucess());
      }
    } on AuthException catch (e) {
      emit(SignInError(e.message));
    }
  }

  void initDependencies() {
    _uc = AuthUC(repository: FirebaseAuthRepository());
  }
}
