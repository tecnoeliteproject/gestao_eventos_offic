import 'package:gestao_eventos/data/models/stock_model.dart';

abstract class IStockDatasource {
  Future<List<StockModel>> getAllStocks();
  Future<StockModel?> getStock(String id);
  Future<bool> createStock(StockModel stock);
  Future<bool> updateStock(StockModel stock);
  Future<bool> deleteStock(StockModel stock);
}
