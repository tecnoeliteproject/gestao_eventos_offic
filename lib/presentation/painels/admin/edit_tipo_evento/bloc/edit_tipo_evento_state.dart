part of 'edit_tipo_evento_bloc.dart';

class EditTipoEventoState extends Equatable {
  const EditTipoEventoState();

  @override
  List<Object> get props => [];
}

class EditTipoEventoInitial extends EditTipoEventoState {
  const EditTipoEventoInitial() : super();
}

class EditTipoEventoLoading extends EditTipoEventoState {
  const EditTipoEventoLoading() : super();
}

class EditTipoEventoSuccess extends EditTipoEventoState {
  const EditTipoEventoSuccess(this.tipoEvento) : super();

  final TipoEvento tipoEvento;

  @override
  List<Object> get props => [tipoEvento];
}

class EditTipoEventoError extends EditTipoEventoState {
  const EditTipoEventoError(this.error) : super();

  final String error;

  @override
  List<Object> get props => [error];
}

class EditTipoEventoFormError extends EditTipoEventoState {
  const EditTipoEventoFormError(this.error) : super();

  final String error;

  @override
  List<Object> get props => [error];
}
