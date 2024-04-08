// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gestao_eventos/presentation/painels/admin/register_stock/bloc/bloc.dart';

void main() {
  group('RegisterStockBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          RegisterStockBloc(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final registerStockBloc = RegisterStockBloc();
      expect(registerStockBloc.state.customProperty, equals('Default Value'));
    });

    blocTest<RegisterStockBloc, RegisterStockState>(
      'CustomRegisterStockEvent emits nothing',
      build: RegisterStockBloc.new,
      act: (bloc) => bloc.add(const CustomRegisterStockEvent()),
      expect: () => <RegisterStockState>[],
    );
  });
}
