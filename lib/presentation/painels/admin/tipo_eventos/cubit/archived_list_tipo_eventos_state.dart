part of 'archived_list_tipo_eventos_cubit.dart';

sealed class ArchivedListTipoEventosState extends Equatable {
  const ArchivedListTipoEventosState();
}

final class ArchivedListTipoEventosInitial
    extends ArchivedListTipoEventosState {
  @override
  List<Object?> get props => [];
}

final class ArchivedListTipoEventosLoading
    extends ArchivedListTipoEventosState {
  @override
  List<Object?> get props => [];
}

final class ArchivedListTipoEventosError extends ArchivedListTipoEventosState {
  @override
  List<Object?> get props => [];
}

final class ArchivedListTipoEventosSuccess
    extends ArchivedListTipoEventosState {
  const ArchivedListTipoEventosSuccess(this.tipos);

  final List<TipoEvento> tipos;

  @override
  List<Object> get props => [tipos];
}
final class UnarchivedListTipoEventosSuccess
    extends ArchivedListTipoEventosState {
  const UnarchivedListTipoEventosSuccess();

  @override
  List<Object> get props => [];
}
