import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'tipo_evento_detail_event.dart';
part 'tipo_evento_detail_state.dart';

class TipoEventoDetailBloc extends Bloc<TipoEventoDetailEvent, TipoEventoDetailState> {
  TipoEventoDetailBloc() : super(const TipoEventoDetailInitial()) {
    on<CustomTipoEventoDetailEvent>(_onCustomTipoEventoDetailEvent);
  }

  FutureOr<void> _onCustomTipoEventoDetailEvent(
    CustomTipoEventoDetailEvent event,
    Emitter<TipoEventoDetailState> emit,
  ) {
    // TODO: Add Logic
  }
}
