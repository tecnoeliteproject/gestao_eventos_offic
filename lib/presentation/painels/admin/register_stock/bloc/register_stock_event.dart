part of 'register_stock_bloc.dart';

abstract class RegisterStockEvent  extends Equatable {
  const RegisterStockEvent();

  @override
  List<Object> get props => [];

}

/// {@template custom_register_stock_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomRegisterStockEvent extends RegisterStockEvent {
  /// {@macro custom_register_stock_event}
  const CustomRegisterStockEvent();
}
