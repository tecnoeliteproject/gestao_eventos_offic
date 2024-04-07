import 'package:gestao_eventos/domain/entities/stock.dart';

abstract class IStockUseCase {
  Future<List<Stock>> getAllStocks();
  Future<Stock?> getStock(String id);
  Future<bool> createStock(Stock stock);
  Future<bool> updateStock(Stock stock);
  Future<bool> deleteStock(Stock stock);
}
