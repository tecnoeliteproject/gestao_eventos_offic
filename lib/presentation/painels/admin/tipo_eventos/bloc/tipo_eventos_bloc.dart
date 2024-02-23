import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'tipo_eventos_event.dart';
part 'tipo_eventos_state.dart';

class TipoEventosBloc extends Bloc<TipoEventosEvent, TipoEventosState> {
  TipoEventosBloc() : super(const TipoEventosInitial()) {
    on<CustomTipoEventosEvent>(_onCustomTipoEventosEvent);
  }

  FutureOr<void> _onCustomTipoEventosEvent(
    CustomTipoEventosEvent event,
    Emitter<TipoEventosState> emit,
  ) {
    // TODO: Add Logic
  }
}
