// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gestao_eventos/presentation/painels/admin/gestao_stock/bloc/bloc.dart';

void main() {
  group('GestaoStockBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          GestaoStockBloc(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final gestaoStockBloc = GestaoStockBloc();
      expect(gestaoStockBloc.state.customProperty, equals('Default Value'));
    });

    blocTest<GestaoStockBloc, GestaoStockState>(
      'CustomGestaoStockEvent emits nothing',
      build: GestaoStockBloc.new,
      act: (bloc) => bloc.add(const CustomGestaoStockEvent()),
      expect: () => <GestaoStockState>[],
    );
  });
}
