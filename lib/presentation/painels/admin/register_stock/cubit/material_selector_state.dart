part of 'material_selector_cubit.dart';

sealed class MaterialSelectorState extends Equatable {
  const MaterialSelectorState();

  @override
  List<Object> get props => [];
}

final class MaterialSelectorInitial extends MaterialSelectorState {}

final class MaterialSelectorLoading extends MaterialSelectorState {}

final class MaterialSelectorEmpty extends MaterialSelectorState {}

final class MaterialSelectorLoaded extends MaterialSelectorState {
  const MaterialSelectorLoaded(this.materials);

  final List<MaterialItem> materials;

  @override
  List<Object> get props => [materials];
}

final class MaterialSelectorError extends MaterialSelectorState {
  const MaterialSelectorError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
