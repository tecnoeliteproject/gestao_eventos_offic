// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:gestao_eventos/presentation/painels/client/pages/tipo_evento_detail/bloc/bloc.dart';

void main() {
  group('TipoEventoDetailState', () {
    test('supports value equality', () {
      expect(
        TipoEventoDetailState(),
        equals(
          const TipoEventoDetailState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const TipoEventoDetailState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const tipoEventoDetailState = TipoEventoDetailState(
            customProperty: 'My property',
          );
          expect(
            tipoEventoDetailState.copyWith(),
            equals(tipoEventoDetailState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const tipoEventoDetailState = TipoEventoDetailState(
            customProperty: 'My property',
          );
          final otherTipoEventoDetailState = TipoEventoDetailState(
            customProperty: 'My property 2',
          );
          expect(tipoEventoDetailState, isNot(equals(otherTipoEventoDetailState)));

          expect(
            tipoEventoDetailState.copyWith(
              customProperty: otherTipoEventoDetailState.customProperty,
            ),
            equals(otherTipoEventoDetailState),
          );
        },
      );
    });
  });
}
