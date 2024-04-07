// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:gestao_eventos/presentation/painels/admin/gestao_stock/bloc/bloc.dart';

void main() {
  group('GestaoStockState', () {
    test('supports value equality', () {
      expect(
        GestaoStockState(),
        equals(
          const GestaoStockState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const GestaoStockState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const gestaoStockState = GestaoStockState(
            customProperty: 'My property',
          );
          expect(
            gestaoStockState.copyWith(),
            equals(gestaoStockState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const gestaoStockState = GestaoStockState(
            customProperty: 'My property',
          );
          final otherGestaoStockState = GestaoStockState(
            customProperty: 'My property 2',
          );
          expect(gestaoStockState, isNot(equals(otherGestaoStockState)));

          expect(
            gestaoStockState.copyWith(
              customProperty: otherGestaoStockState.customProperty,
            ),
            equals(otherGestaoStockState),
          );
        },
      );
    });
  });
}
