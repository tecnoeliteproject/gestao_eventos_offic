import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gestao_eventos/core/dependences/get_it.dart';
import 'package:gestao_eventos/domain/entities/tipo_evento.dart';
import 'package:gestao_eventos/domain/usecases_interfaces/i_tipo_evento_usecase.dart';

part 'archived_list_tipo_eventos_state.dart';

class ArchivedListTipoEventosCubit extends Cubit<ArchivedListTipoEventosState> {
  ArchivedListTipoEventosCubit() : super(ArchivedListTipoEventosInitial()) {
    _tipoEventosUseCase = getIt<ITipoEventoUseCase>();
  }

  late final ITipoEventoUseCase _tipoEventosUseCase;

  Future<void> desarquivarTipoEvento(TipoEvento tipoEvento) async {
    emit(ArchivedListTipoEventosLoading());
    final result = await _tipoEventosUseCase.desarquivarTipoEvento(tipoEvento);

    if (result) {
      emit(const UnarchivedListTipoEventosSuccess());
      await listArchivedTipoEventos();
    } else {
      emit(ArchivedListTipoEventosError());
    }
  }

  Future<void> listArchivedTipoEventos() async {
    emit(ArchivedListTipoEventosLoading());

    try {
      final result = await _getArchivedTipoEventos();
      emit(ArchivedListTipoEventosSuccess(result.reversed.toList()));
    } catch (e) {
      log(e.toString());
      emit(ArchivedListTipoEventosError());
    }
  }

  Future<List<TipoEvento>> _getArchivedTipoEventos() =>
      _tipoEventosUseCase.getArchivedTipoEventos();
}
