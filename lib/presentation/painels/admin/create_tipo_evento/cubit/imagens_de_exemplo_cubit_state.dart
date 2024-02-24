part of 'imagens_de_exemplo_cubit_cubit.dart';

sealed class ImagensDeExemploFromState extends Equatable {
  const ImagensDeExemploFromState(this.exemplos);

  final List<String> exemplos;

  @override
  List<Object> get props => [exemplos];
}

final class ImagensDeExemploCubitInitial extends ImagensDeExemploFromState {
  ImagensDeExemploCubitInitial() : super([]);
}

final class ImagensDeExemploCubitChanged extends ImagensDeExemploFromState {
  const ImagensDeExemploCubitChanged(super.exemplos);

  @override
  List<Object> get props => [exemplos];
}
