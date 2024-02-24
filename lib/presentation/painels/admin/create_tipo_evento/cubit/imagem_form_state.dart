part of 'imagem_form_cubit.dart';

sealed class ImagemFormState extends Equatable {
  const ImagemFormState({this.imagem});

  final String? imagem;

  @override
  List<Object> get props => [];
}

final class ImagemFormInitial extends ImagemFormState {}

final class ImagemFormChanged extends ImagemFormState {
  const ImagemFormChanged({required super.imagem});

  @override
  List<Object> get props => [imagem!];
}

final class WebImagemFormChanged extends ImagemFormState {
  const WebImagemFormChanged(this.bytesFromPicker);

  final Uint8List? bytesFromPicker;

  @override
  List<Object> get props => [bytesFromPicker!];
}
