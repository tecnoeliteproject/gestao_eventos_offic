import 'package:gestao_eventos/data/datasources/i_stock_datasource.dart';
import 'package:gestao_eventos/data/models/stock_model.dart';
import 'package:gestao_eventos/data/repositories_interfaces/i_stock_repository.dart';
import 'package:gestao_eventos/domain/entities/stock.dart';

class StockRepository implements IStockRepository {
  StockRepository(this._datasource);

  final IStockDatasource _datasource;

  @override
  Future<bool> createStock(Stock stock) {
    return _datasource.createStock(StockModel.fromEntity(stock));
  }

  @override
  Future<bool> deleteStock(Stock stock) {
    return _datasource.deleteStock(StockModel.fromEntity(stock));
  }

  @override
  Future<List<Stock>> getAllStocks() {
    return _datasource
        .getAllStocks()
        .then((value) => value.map((e) => e.toEntity()).toList());
  }

  @override
  Future<Stock?> getStock(String id) {
    return _datasource.getStock(id).then((value) => value?.toEntity());
  }

  @override
  Future<bool> updateStock(Stock stock) {
    return _datasource.updateStock(StockModel.fromEntity(stock));
  }
}
