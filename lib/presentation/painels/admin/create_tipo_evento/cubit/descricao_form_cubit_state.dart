part of 'descricao_form_cubit_cubit.dart';

sealed class DescricaoFormCubitState extends Equatable {
  const DescricaoFormCubitState(this.descricao);

  final String descricao;

  @override
  List<Object> get props => [];
}

final class DescricaoFormCubitInitial extends DescricaoFormCubitState {
  const DescricaoFormCubitInitial() : super('');
}

final class DescricaoFormCubitChanged extends DescricaoFormCubitState {
  const DescricaoFormCubitChanged(super.descricao);

  @override
  List<Object> get props => [descricao];
}
