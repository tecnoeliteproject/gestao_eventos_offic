part of 'edit_imagens_de_exemplo_cubit_cubit.dart';

sealed class EditImagensDeExemploFromState extends Equatable {
  const EditImagensDeExemploFromState(this.exemplos);

  final List<CImage> exemplos;

  @override
  List<Object> get props => [exemplos];
}

final class EditImagensDeExemploCubitInitial
    extends EditImagensDeExemploFromState {
  const EditImagensDeExemploCubitInitial([super.exemplos = const []]);
}

final class EditImagensDeExemploCubitChanged
    extends EditImagensDeExemploFromState {
  const EditImagensDeExemploCubitChanged(super.exemplos);
}
