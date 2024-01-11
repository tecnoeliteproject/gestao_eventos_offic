import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:gestao_eventos/presentation/auth/sign_in/bloc/sign_in_event.dart';
import 'package:gestao_eventos/presentation/auth/sign_in/bloc/sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  int number = 10;
  SignInBloc(super.initialState){
    on<SignInEvent>((event, emit) {
      number++;
      emit(SignInLoading());
      // USE event.email and event.password to login
      // WHEN SUCESS
      event.onSucess();
      emit(SignInSucess());
      print(number);
    },);
  }
  
}