import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gestao_eventos/domain/entities/tipo_evento.dart';
part 'product_details_event.dart';
part 'product_details_state.dart';

class ProductDetailsBloc
    extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  ProductDetailsBloc() : super(const ProductDetailsInitial()) {
    on<RefreshProductEvent>(_onRefreshProductEvent);
  }

  FutureOr<void> _onRefreshProductEvent(
    RefreshProductEvent event,
    Emitter<ProductDetailsState> emit,
  ) {
    emit(
      UpdateEditTipoEvento(event.tipoEvento),
    );
  }
}
