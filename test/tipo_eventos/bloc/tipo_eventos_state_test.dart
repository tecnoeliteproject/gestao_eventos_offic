// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:gestao_eventos/presentation/painels/admin/tipo_eventos/bloc/bloc.dart';

void main() {
  group('TipoEventosState', () {
    test('supports value equality', () {
      expect(
        TipoEventosState(),
        equals(
          const TipoEventosState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const TipoEventosState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const tipoEventosState = TipoEventosState(
            customProperty: 'My property',
          );
          expect(
            tipoEventosState.copyWith(),
            equals(tipoEventosState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const tipoEventosState = TipoEventosState(
            customProperty: 'My property',
          );
          final otherTipoEventosState = TipoEventosState(
            customProperty: 'My property 2',
          );
          expect(tipoEventosState, isNot(equals(otherTipoEventosState)));

          expect(
            tipoEventosState.copyWith(
              customProperty: otherTipoEventosState.customProperty,
            ),
            equals(otherTipoEventosState),
          );
        },
      );
    });
  });
}
