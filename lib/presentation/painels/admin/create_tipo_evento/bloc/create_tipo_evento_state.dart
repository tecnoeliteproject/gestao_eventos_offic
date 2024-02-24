part of 'create_tipo_evento_bloc.dart';

class CreateTipoEventoState extends Equatable {
  const CreateTipoEventoState();

  @override
  List<Object> get props => [];
}

class CreateTipoEventoInitial extends CreateTipoEventoState {
  const CreateTipoEventoInitial() : super();
}

class CreateTipoEventoLoading extends CreateTipoEventoState {
  const CreateTipoEventoLoading() : super();
}

class CreateTipoEventoSuccess extends CreateTipoEventoState {
  const CreateTipoEventoSuccess() : super();
}

class CreateTipoEventoError extends CreateTipoEventoState {
  const CreateTipoEventoError(this.error) : super();

  final String error;

  @override
  List<Object> get props => [error];
}

class CreateTipoEventoFormError extends CreateTipoEventoState {
  const CreateTipoEventoFormError(this.error) : super();

  final String error;

  @override
  List<Object> get props => [error];
}
