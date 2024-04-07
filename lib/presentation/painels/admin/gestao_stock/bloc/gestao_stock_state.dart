part of 'gestao_stock_bloc.dart';

/// {@template gestao_stock_state}
/// GestaoStockState description
/// {@endtemplate}
class GestaoStockState extends Equatable {
  /// {@macro gestao_stock_state}
  const GestaoStockState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current GestaoStockState with property changes
  GestaoStockState copyWith({
    String? customProperty,
  }) {
    return GestaoStockState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

/// {@template gestao_stock_initial}
/// The initial state of GestaoStockState
/// {@endtemplate}
class GestaoStockInitial extends GestaoStockState {
  /// {@macro gestao_stock_initial}
  const GestaoStockInitial() : super();
}
