part of 'search_tipo_eventos_cubit.dart';

sealed class SearchTipoEventosState extends Equatable {
  const SearchTipoEventosState();

  @override
  List<Object> get props => [];
}

final class SearchTipoEventosInitial extends SearchTipoEventosState {}

final class SearchTipoEventosEnabled extends SearchTipoEventosState {}

final class SearchTipoEventosDisanabled extends SearchTipoEventosState {}
