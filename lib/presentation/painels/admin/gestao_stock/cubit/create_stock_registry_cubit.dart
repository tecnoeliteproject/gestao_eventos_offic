import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gestao_eventos/core/dependences/get_it.dart';
import 'package:gestao_eventos/domain/entities/stock.dart';
import 'package:gestao_eventos/domain/usecases_interfaces/i_stock_usecase.dart';
import 'package:uuid/uuid.dart';

part 'create_stock_registry_state.dart';

class CreateStockRegistryCubit extends Cubit<CreateStockRegistryState> {
  CreateStockRegistryCubit() : super(CreateStockRegistryInitial()) {
    _stockUseCase = getIt();
  }

  late final IStockUseCase _stockUseCase;

  Future<void> createStock() async {
      emit(CreateStockRegistryLoading());
    final stock = _createFakeStockEntity();

    final result = await _stockUseCase.createStock(stock);

    if (result) {
      emit(CreateStockRegistrySuccess());
    } else {
      emit(CreateStockRegistryError());
    }
  }

  Stock _createFakeStockEntity() {
    return Stock(
      id: const Uuid().v4(),
      materialId: const Uuid().v4(),
      operacao: 'entrada',
      precoUnitario: 10,
      quantidade: 5,
      data: DateTime.now(),
      motivo: 'Emprestimo a um cliente',
      descricaoMaterial: 'Cadeira branca de quatro pernos',
      localizacao: 'Armazem 2',
      usuarioResponsavel: const Uuid().v4(),
      condicao: 'Bom',
    );
  }
}
