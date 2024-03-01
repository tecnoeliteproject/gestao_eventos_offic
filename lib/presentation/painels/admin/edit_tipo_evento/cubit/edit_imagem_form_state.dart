part of 'edit_imagem_form_cubit.dart';

sealed class EditImagemFormState extends Equatable {
  const EditImagemFormState({this.imagem});

  final CImage? imagem;

  @override
  List<Object> get props => [];
}

final class EditImagemFormInitial extends EditImagemFormState {}

final class EditImagemFormChanged extends EditImagemFormState {
  const EditImagemFormChanged({required super.imagem});

  @override
  List<Object> get props => [imagem!];
}
