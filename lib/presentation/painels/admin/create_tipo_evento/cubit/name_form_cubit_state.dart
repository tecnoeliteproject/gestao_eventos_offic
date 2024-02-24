part of 'name_form_cubit_cubit.dart';

sealed class NameFormCubitState extends Equatable {
  const NameFormCubitState(this.name);

  final String name;

  @override
  List<Object> get props => [];
}

final class NameFormCubitInitial extends NameFormCubitState {
  const NameFormCubitInitial() : super('');
}

final class NameFormCubitChanged extends NameFormCubitState {
  const NameFormCubitChanged(super.name);

  @override
  List<Object> get props => [name];
}
