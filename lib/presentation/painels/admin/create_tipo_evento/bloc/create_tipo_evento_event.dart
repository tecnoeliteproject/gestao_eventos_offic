part of 'create_tipo_evento_bloc.dart';

abstract class CreateTipoEventoEvent extends Equatable {
  const CreateTipoEventoEvent();

  @override
  List<Object> get props => [];
}

/// {@template custom_create_tipo_evento_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class AddTipoEventoEvent extends CreateTipoEventoEvent {
  /// {@macro custom_create_tipo_evento_event}
  const AddTipoEventoEvent();
}
