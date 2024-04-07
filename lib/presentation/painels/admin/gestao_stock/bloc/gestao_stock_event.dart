part of 'gestao_stock_bloc.dart';

abstract class GestaoStockEvent  extends Equatable {
  const GestaoStockEvent();

  @override
  List<Object> get props => [];

}

/// {@template custom_gestao_stock_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomGestaoStockEvent extends GestaoStockEvent {
  /// {@macro custom_gestao_stock_event}
  const CustomGestaoStockEvent();
}
