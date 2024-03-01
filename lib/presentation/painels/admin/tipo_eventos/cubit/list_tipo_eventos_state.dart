part of 'list_tipo_eventos_cubit.dart';

sealed class ListTipoEventosState extends Equatable {
  const ListTipoEventosState();

  @override
  List<Object> get props => [];
}

final class ListTipoEventosInitial extends ListTipoEventosState {}

final class ListTipoEventosLoading extends ListTipoEventosState {}

final class ListTipoEventosError extends ListTipoEventosState {}

final class ListTipoEventosSuccess extends ListTipoEventosState {
  const ListTipoEventosSuccess(this.tipos);

  final List<TipoEvento> tipos;

  @override
  List<Object> get props => [tipos];
}
