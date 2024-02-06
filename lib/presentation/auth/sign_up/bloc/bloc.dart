import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestao_eventos/core/error/auth_exceptions.dart';
import 'package:gestao_eventos/data/repositories/firebase_auth_repository.dart';
import 'package:gestao_eventos/domain/usecases/auth_uc.dart';
import 'package:gestao_eventos/presentation/auth/sign_up/bloc/sign_up_event.dart';
import 'package:gestao_eventos/presentation/auth/sign_up/bloc/sign_up_state.dart';

class SignUpBloc extends Bloc<SigningUpEvent, SignUpState>{
  SignUpBloc(SignUpInitialState initialState) : super(initialState){
    initDependencies();
    on<SigningUpEvent>((event, emit)async{
      await _signup(emit, event);
    });
  }

  late AuthUC _uc;
  
  
  _signup(Emitter<SignUpState> emit, SigningUpEvent event) async{
    emit(SignUpLoading());
    try {
      if ((await _uc.signUp(event.email, event.password)) == true) {
        emit(SignUpSucess());
      }else{
      }
    } on AuthException catch (e) {
      emit(SignUpError(e.message));
    }
  }
  
  void initDependencies() {
    _uc = AuthUC(repository: FirebaseAuthRepository());
  }
}