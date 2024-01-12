import 'package:bloc/bloc.dart';
import 'package:gestao_eventos/presentation/auth/sign_in/bloc/sign_in_event.dart';
import 'package:gestao_eventos/presentation/auth/sign_in/bloc/sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc(super.initialState){
    on<SignInEvent>((event, emit) {
      emit(SignInLoading());
      // USE event.email and event.password to login
      // WHEN SUCESS
      // ignore: avoid_dynamic_calls
      emit(SignInSucess());
    },);
  }
  
}