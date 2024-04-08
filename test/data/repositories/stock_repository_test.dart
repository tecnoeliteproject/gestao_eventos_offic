import 'package:flutter_test/flutter_test.dart';
import 'package:gestao_eventos/data/datasources/i_stock_datasource.dart';
import 'package:gestao_eventos/data/models/stock_model.dart';
import 'package:gestao_eventos/data/repositories/stock_repository.dart';
import 'package:gestao_eventos/data/repositories_interfaces/i_stock_repository.dart';
import 'package:gestao_eventos/domain/entities/material_item.dart';
import 'package:gestao_eventos/domain/entities/stock.dart';
import 'package:mocktail/mocktail.dart';
import 'package:uuid/uuid.dart';

// mock IStockDatasource
class StockDatasourceMock extends Mock implements IStockDatasource {}

class StockMock extends Fake implements StockModel {}

void main() {
  setUpAll(() {
    registerFallbackValue(StockMock());
  });

  late IStockDatasource stockDatasource;
  late IStockRepository stockRepository;

  setUp(() {
    stockDatasource = StockDatasourceMock();
    stockRepository = StockRepository(stockDatasource);
  });

  group('Gestao de stock repository', () {
    test('createStock', () async {
      when(() => stockDatasource.createStock(any())).thenAnswer(
        (_) async => true,
      );

      final stock = _createFakeStockEntity();
      final result = await stockRepository.createStock(stock);

      expect(result, true);
      verify(() => stockDatasource.createStock(StockModel.fromEntity(stock)))
          .called(1);
    });

    test('deleteStock', () {});
    test('getAllStocks', () async {
      final stock = _createFakeStockEntity();
      when(() => stockDatasource.getAllStocks()).thenAnswer(
        (_) async => [StockModel.fromEntity(stock)],
      );

      final result = await stockRepository.getAllStocks();

      expect(result, isA<List<Stock>>());
      expect(result.length, 1);
      verify(() => stockDatasource.getAllStocks()).called(1);
    });

    test('getStock', () async {
      final stock = _createFakeStockEntity();
      when(() => stockDatasource.getStock(any())).thenAnswer(
        (_) async => StockModel.fromEntity(stock),
      );

      final result = await stockRepository.getStock(stock.id);

      expect(result, isA<Stock?>());
      expect(result?.id, stock.id);
      verify(() => stockDatasource.getStock(stock.id)).called(1);
    });

    test('updateStock', () {});
  });
}

Stock _createFakeStockEntity() {
  return Stock(
    id: const Uuid().v4(),
    material: MaterialItem(
      id: const Uuid().v4(),
      nome: 'Cadeira',
      descricao: 'Cadeira branca de quatro pernos',
      quantidade: 5,
      precoUnitario: 0,
    ),
    operacao: 'entrada',
    data: DateTime.now(),
    motivo: 'Emprestimo a um cliente',
    obs: 'Cadeira branca de quatro pernos',
    localizacao: 'Armazem 2',
    usuarioResponsavelId: const Uuid().v4(),
    condicao: 'Bom',
  );
}

/*
  required this.id,
    required this.materialId,
    required this.operacao,
    required this.precoUnitario,
    required this.quantidade,
    required this.data,
    this.motivo,
    this.descricaoMaterial,
    this.localizacao,
    this.usuarioResponsavel,
    this.condicao,
    this.fotoUrl,
*/
