part of 'product_details_bloc.dart';

/// {@template product_details_state}
/// ProductDetailsState description
/// {@endtemplate}
class ProductDetailsState extends Equatable {
  const ProductDetailsState();

  @override
  List<Object?> get props => [];
}

/// {@template product_details_initial}
/// The initial state of ProductDetailsState
/// {@endtemplate}
class ProductDetailsInitial extends ProductDetailsState {
  /// {@macro product_details_initial}
  const ProductDetailsInitial() : super();
}

class UpdateEditTipoEvento extends ProductDetailsState {
  const UpdateEditTipoEvento(this.tipoEvento) : super();

  final TipoEvento tipoEvento;

  @override
  List<Object> get props => [tipoEvento];
}
