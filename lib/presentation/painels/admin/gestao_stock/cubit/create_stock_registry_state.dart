part of 'create_stock_registry_cubit.dart';

sealed class CreateStockRegistryState extends Equatable {
  const CreateStockRegistryState();

  @override
  List<Object> get props => [];
}

final class CreateStockRegistryInitial extends CreateStockRegistryState {}

final class CreateStockRegistrySuccess extends CreateStockRegistryState {}

final class CreateStockRegistryError extends CreateStockRegistryState {}

final class CreateStockRegistryLoading extends CreateStockRegistryState {}
