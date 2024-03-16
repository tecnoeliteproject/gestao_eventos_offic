// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gestao_eventos/presentation/painels/client/pages/tipo_evento_detail/bloc/bloc.dart';

void main() {
  group('TipoEventoDetailBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          TipoEventoDetailBloc(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final tipoEventoDetailBloc = TipoEventoDetailBloc();
      expect(tipoEventoDetailBloc.state.customProperty, equals('Default Value'));
    });

    blocTest<TipoEventoDetailBloc, TipoEventoDetailState>(
      'CustomTipoEventoDetailEvent emits nothing',
      build: TipoEventoDetailBloc.new,
      act: (bloc) => bloc.add(const CustomTipoEventoDetailEvent()),
      expect: () => <TipoEventoDetailState>[],
    );
  });
}
