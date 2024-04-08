part of 'register_stock_bloc.dart';

/// {@template register_stock_state}
/// RegisterStockState description
/// {@endtemplate}
class RegisterStockState extends Equatable {
  /// {@macro register_stock_state}
  const RegisterStockState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current RegisterStockState with property changes
  RegisterStockState copyWith({
    String? customProperty,
  }) {
    return RegisterStockState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

/// {@template register_stock_initial}
/// The initial state of RegisterStockState
/// {@endtemplate}
class RegisterStockInitial extends RegisterStockState {
  /// {@macro register_stock_initial}
  const RegisterStockInitial() : super();
}
