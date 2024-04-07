import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'gestao_stock_event.dart';
part 'gestao_stock_state.dart';

class GestaoStockBloc extends Bloc<GestaoStockEvent, GestaoStockState> {
  GestaoStockBloc() : super(const GestaoStockInitial()) {
    on<CustomGestaoStockEvent>(_onCustomGestaoStockEvent);
  }

  FutureOr<void> _onCustomGestaoStockEvent(
    CustomGestaoStockEvent event,
    Emitter<GestaoStockState> emit,
  ) {
    // TODO: Add Logic
  }
}
