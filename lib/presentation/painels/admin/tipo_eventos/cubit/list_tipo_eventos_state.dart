part of 'list_tipo_eventos_cubit.dart';

sealed class ListTipoEventosState extends Equatable {
  const ListTipoEventosState();
}

final class ListTipoEventosInitial extends ListTipoEventosState {
  @override
  List<Object?> get props => [];
}

final class ListTipoEventosLoading extends ListTipoEventosState {
  @override
  List<Object?> get props => [];
}

final class ListTipoEventosError extends ListTipoEventosState {
  @override
  List<Object?> get props => [];
}

final class ListTipoEventosSuccess extends ListTipoEventosState {
  const ListTipoEventosSuccess(this.tipos);

  final List<TipoEvento> tipos;

  @override
  List<Object> get props => [tipos];
}
