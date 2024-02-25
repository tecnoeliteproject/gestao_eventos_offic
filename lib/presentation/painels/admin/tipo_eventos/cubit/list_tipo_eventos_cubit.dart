import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gestao_eventos/core/dependences/get_it.dart';
import 'package:gestao_eventos/domain/entities/tipo_evento.dart';
import 'package:gestao_eventos/domain/usecases_interfaces/i_tipo_evento_usecase.dart';

part 'list_tipo_eventos_state.dart';

class ListTipoEventosCubit extends Cubit<ListTipoEventosState> {
  ListTipoEventosCubit() : super(ListTipoEventosInitial()) {
    _tipoEventosUseCase = getIt<ITipoEventoUseCase>();
  }

  late final ITipoEventoUseCase _tipoEventosUseCase;

  Future<void> listTipoEventos() async {
    emit(ListTipoEventosLoading());

    try {
      final result = await _tipoEventosUseCase.getTipoEventos();

      emit(ListTipoEventosSuccess(result));
    } catch (e) {
      log(e.toString());
      emit(ListTipoEventosError());
    }
  }
}
