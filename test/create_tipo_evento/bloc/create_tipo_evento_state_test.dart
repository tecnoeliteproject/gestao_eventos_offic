// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:gestao_eventos/presentation/painels/admin/create_tipo_evento/bloc/bloc.dart';

void main() {
  group('CreateTipoEventoState', () {
    test('supports value equality', () {
      expect(
        CreateTipoEventoState(),
        equals(
          const CreateTipoEventoState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CreateTipoEventoState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const createTipoEventoState = CreateTipoEventoState(
            customProperty: 'My property',
          );
          expect(
            createTipoEventoState.copyWith(),
            equals(createTipoEventoState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const createTipoEventoState = CreateTipoEventoState(
            customProperty: 'My property',
          );
          final otherCreateTipoEventoState = CreateTipoEventoState(
            customProperty: 'My property 2',
          );
          expect(createTipoEventoState, isNot(equals(otherCreateTipoEventoState)));

          expect(
            createTipoEventoState.copyWith(
              customProperty: otherCreateTipoEventoState.customProperty,
            ),
            equals(otherCreateTipoEventoState),
          );
        },
      );
    });
  });
}
