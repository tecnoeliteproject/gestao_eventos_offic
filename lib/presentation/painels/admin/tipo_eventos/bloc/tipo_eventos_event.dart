part of 'tipo_eventos_bloc.dart';

abstract class TipoEventosEvent  extends Equatable {
  const TipoEventosEvent();

  @override
  List<Object> get props => [];

}

/// {@template custom_tipo_eventos_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomTipoEventosEvent extends TipoEventosEvent {
  /// {@macro custom_tipo_eventos_event}
  const CustomTipoEventosEvent();
}
