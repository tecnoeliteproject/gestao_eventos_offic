// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gestao_eventos/presentation/painels/admin/tipo_eventos/bloc/bloc.dart';

void main() {
  group('TipoEventosBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          TipoEventosBloc(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final tipoEventosBloc = TipoEventosBloc();
      expect(tipoEventosBloc.state.customProperty, equals('Default Value'));
    });

    blocTest<TipoEventosBloc, TipoEventosState>(
      'CustomTipoEventosEvent emits nothing',
      build: TipoEventosBloc.new,
      act: (bloc) => bloc.add(const CustomTipoEventosEvent()),
      expect: () => <TipoEventosState>[],
    );
  });
}
