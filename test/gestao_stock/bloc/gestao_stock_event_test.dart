// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:gestao_eventos/presentation/painels/admin/gestao_stock/bloc/bloc.dart';

void main() {
  group('GestaoStockEvent', () {  
    group('CustomGestaoStockEvent', () {
      test('supports value equality', () {
        expect(
          CustomGestaoStockEvent(),
          equals(const CustomGestaoStockEvent()),
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CustomGestaoStockEvent(),
          isNotNull
        );
      });
    });
  });
}
