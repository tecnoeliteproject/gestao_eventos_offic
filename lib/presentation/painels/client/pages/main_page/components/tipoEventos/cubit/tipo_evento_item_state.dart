part of 'tipo_evento_item_cubit.dart';

sealed class TipoEventoItemState extends Equatable {
  const TipoEventoItemState();

  @override
  List<Object> get props => [];
}

final class TipoEventoItemInitial extends TipoEventoItemState {}

final class TipoEventoItemLoading extends TipoEventoItemState {}

final class TipoEventoItemLoaded extends TipoEventoItemState {
  const TipoEventoItemLoaded({required this.tipoEventos});

  final List<TipoEvento> tipoEventos;

  @override
  List<Object> get props => [tipoEventos];
}

final class TipoEventoItemError extends TipoEventoItemState {
  const TipoEventoItemError({required this.error});

  final String error;

  @override
  List<Object> get props => [error];
}
