part of 'product_details_bloc.dart';

abstract class ProductDetailsEvent extends Equatable {
  const ProductDetailsEvent();

  @override
  List<Object> get props => [];
}

class RefreshProductEvent extends ProductDetailsEvent {
  const RefreshProductEvent(this.tipoEvento);

  final TipoEvento tipoEvento;

  @override
  List<Object> get props => [tipoEvento];
}
