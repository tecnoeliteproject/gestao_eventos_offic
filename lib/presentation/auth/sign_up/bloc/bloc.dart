import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestao_eventos/core/error/auth_exceptions.dart';
import 'package:gestao_eventos/data/repositories/firebase_auth_repository.dart';
import 'package:gestao_eventos/domain/usecases/auth_uc.dart';
import 'package:gestao_eventos/domain/usecases_interfaces/i_auth_uc.dart';
import 'package:gestao_eventos/presentation/auth/sign_up/bloc/sign_up_event.dart';
import 'package:gestao_eventos/presentation/auth/sign_up/bloc/sign_up_state.dart';

class SignUpBloc extends Bloc<SigningUpEvent, SignUpState> {
  SignUpBloc(SignUpInitialState super.initialState) {
    initDependencies();
    on<SigningUpEvent>((event, emit) async {
      await _signup(emit, event);
    });
  }

  late IAuthUC _uc;

  Future<void> _signup(Emitter<SignUpState> emit, SigningUpEvent event) async {
    emit(SignUpLoading());
    try {
      final user = await _uc.signUp(event.name ,event.email, event.password);
      emit(SignUpSucess(user: user));
    } on AuthException catch (e) {
      emit(SigningUpError(e.message));
    }
  }

  void initDependencies() {
    _uc = AuthUC(repository: FirebaseAuthRepository());
  }
}
