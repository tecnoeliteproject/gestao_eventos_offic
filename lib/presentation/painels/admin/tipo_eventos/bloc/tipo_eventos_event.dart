part of 'tipo_eventos_bloc.dart';

abstract class TipoEventosEvent extends Equatable {
  const TipoEventosEvent();

  @override
  List<Object> get props => [];
}

class CustomTipoEventosEvent extends TipoEventosEvent {
  const CustomTipoEventosEvent();
}

class GetTipoEventosEvent extends TipoEventosEvent {
  const GetTipoEventosEvent();
}
