part of 'imagens_de_exemplo_cubit_cubit.dart';

sealed class ImagensDeExemploFromState extends Equatable {
  const ImagensDeExemploFromState(this.exemplos);

  final List<Object> exemplos;

  @override
  List<Object> get props => [];
}

final class ImagensDeExemploCubitInitial extends ImagensDeExemploFromState {
  const ImagensDeExemploCubitInitial([super.exemplos = const []]);
}

final class ImagensDeExemploCubitChanged extends ImagensDeExemploFromState {
  const ImagensDeExemploCubitChanged(this.exemplos) : super(exemplos);

  @override
  // ignore: overridden_fields
  final List<String> exemplos;

  @override
  List<Object> get props => [exemplos];
}

final class WebImagensDeExemploCubitChanged extends ImagensDeExemploFromState {
  const WebImagensDeExemploCubitChanged(this.exemplos) : super(exemplos);

  @override
  // ignore: overridden_fields
  final List<Uint8List> exemplos;

  @override
  List<Object> get props => [exemplos];
}
