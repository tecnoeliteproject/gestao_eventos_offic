// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:gestao_eventos/presentation/painels/admin/tipo_eventos/bloc/bloc.dart';

void main() {
  group('TipoEventosEvent', () {  
    group('CustomTipoEventosEvent', () {
      test('supports value equality', () {
        expect(
          CustomTipoEventosEvent(),
          equals(const CustomTipoEventosEvent()),
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CustomTipoEventosEvent(),
          isNotNull
        );
      });
    });
  });
}
