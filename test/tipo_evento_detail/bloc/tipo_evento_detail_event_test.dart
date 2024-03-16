// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:gestao_eventos/presentation/painels/client/pages/tipo_evento_detail/bloc/bloc.dart';

void main() {
  group('TipoEventoDetailEvent', () {  
    group('CustomTipoEventoDetailEvent', () {
      test('supports value equality', () {
        expect(
          CustomTipoEventoDetailEvent(),
          equals(const CustomTipoEventoDetailEvent()),
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CustomTipoEventoDetailEvent(),
          isNotNull
        );
      });
    });
  });
}
