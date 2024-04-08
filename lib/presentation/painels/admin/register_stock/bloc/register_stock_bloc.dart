import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'register_stock_event.dart';
part 'register_stock_state.dart';

class RegisterStockBloc extends Bloc<RegisterStockEvent, RegisterStockState> {
  RegisterStockBloc() : super(const RegisterStockInitial()) {
    on<CustomRegisterStockEvent>(_onCustomRegisterStockEvent);
  }

  FutureOr<void> _onCustomRegisterStockEvent(
    CustomRegisterStockEvent event,
    Emitter<RegisterStockState> emit,
  ) {
    // TODO: Add Logic
  }
}
