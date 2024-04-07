import 'package:gestao_eventos/data/repositories_interfaces/i_stock_repository.dart';
import 'package:gestao_eventos/domain/entities/stock.dart';
import 'package:gestao_eventos/domain/usecases_interfaces/i_stock_usecase.dart';

class StockUseCase implements IStockUseCase {
  StockUseCase(this._iStockRepository);

  final IStockRepository _iStockRepository;

  @override
  Future<bool> createStock(Stock stock) {
    return _iStockRepository.createStock(stock);
  }

  @override
  Future<bool> deleteStock(Stock stock) {
    return _iStockRepository.deleteStock(stock);
  }

  @override
  Future<List<Stock>> getAllStocks() {
    return _iStockRepository.getAllStocks();
  }

  @override
  Future<Stock?> getStock(String id) {
    return _iStockRepository.getStock(id);
  }

  @override
  Future<bool> updateStock(Stock stock) {
    return _iStockRepository.updateStock(stock);
  }
}
