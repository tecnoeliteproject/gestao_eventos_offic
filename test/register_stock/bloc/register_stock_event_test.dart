// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:gestao_eventos/presentation/painels/admin/register_stock/bloc/bloc.dart';

void main() {
  group('RegisterStockEvent', () {  
    group('CustomRegisterStockEvent', () {
      test('supports value equality', () {
        expect(
          CustomRegisterStockEvent(),
          equals(const CustomRegisterStockEvent()),
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CustomRegisterStockEvent(),
          isNotNull
        );
      });
    });
  });
}
