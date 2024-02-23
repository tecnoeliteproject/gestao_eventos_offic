import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'product_details_event.dart';
part 'product_details_state.dart';

class ProductDetailsBloc extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  ProductDetailsBloc() : super(const ProductDetailsInitial()) {
    on<CustomProductDetailsEvent>(_onCustomProductDetailsEvent);
  }

  FutureOr<void> _onCustomProductDetailsEvent(
    CustomProductDetailsEvent event,
    Emitter<ProductDetailsState> emit,
  ) {
    // TODO: Add Logic
  }
}
