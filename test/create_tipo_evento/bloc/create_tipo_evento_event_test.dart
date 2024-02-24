// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:gestao_eventos/presentation/painels/admin/create_tipo_evento/bloc/bloc.dart';

void main() {
  group('CreateTipoEventoEvent', () {
    group('CustomCreateTipoEventoEvent', () {
      test('supports value equality', () {
        expect(
          AddTipoEventoEvent(),
          equals(const AddTipoEventoEvent()),
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(const AddTipoEventoEvent(), isNotNull);
      });
    });
  });
}
