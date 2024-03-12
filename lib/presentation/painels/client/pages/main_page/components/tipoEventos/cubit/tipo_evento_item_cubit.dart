import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gestao_eventos/core/dependences/get_it.dart';
import 'package:gestao_eventos/domain/entities/tipo_evento.dart';
import 'package:gestao_eventos/domain/usecases_interfaces/i_tipo_evento_usecase.dart';

part 'tipo_evento_item_state.dart';

class TipoEventoItemCubit extends Cubit<TipoEventoItemState> {
  TipoEventoItemCubit() : super(TipoEventoItemInitial()) {
    _tipoEventoUseCase = getIt<ITipoEventoUseCase>();
  }

  late final ITipoEventoUseCase _tipoEventoUseCase;

  Future<void> getTipoEventos() async {
    emit(TipoEventoItemLoading());
    try {
      final tipoEventos = await _tipoEventoUseCase.getTipoEventos();
      emit(TipoEventoItemLoaded(tipoEventos: tipoEventos));
    } catch (e) {
      emit(TipoEventoItemError(error: e.toString()));
    }
  }
}
