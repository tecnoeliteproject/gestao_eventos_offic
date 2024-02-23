import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_tipo_eventos_state.dart';

class SearchTipoEventosCubit extends Cubit<SearchTipoEventosState> {
  SearchTipoEventosCubit() : super(SearchTipoEventosInitial());

  void enable() {
    emit(SearchTipoEventosEnabled());
  }

  void disable() {
    emit(SearchTipoEventosDisanabled());
  }

  void switchSearchState() {
    if (state is SearchTipoEventosEnabled) {
      disable();
    } else if (state is SearchTipoEventosDisanabled ||
        state is SearchTipoEventosInitial) {
      enable();
    }
  }
}
