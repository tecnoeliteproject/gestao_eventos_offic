// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:gestao_eventos/presentation/painels/admin/register_stock/bloc/bloc.dart';

void main() {
  group('RegisterStockState', () {
    test('supports value equality', () {
      expect(
        RegisterStockState(),
        equals(
          const RegisterStockState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const RegisterStockState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const registerStockState = RegisterStockState(
            customProperty: 'My property',
          );
          expect(
            registerStockState.copyWith(),
            equals(registerStockState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const registerStockState = RegisterStockState(
            customProperty: 'My property',
          );
          final otherRegisterStockState = RegisterStockState(
            customProperty: 'My property 2',
          );
          expect(registerStockState, isNot(equals(otherRegisterStockState)));

          expect(
            registerStockState.copyWith(
              customProperty: otherRegisterStockState.customProperty,
            ),
            equals(otherRegisterStockState),
          );
        },
      );
    });
  });
}
