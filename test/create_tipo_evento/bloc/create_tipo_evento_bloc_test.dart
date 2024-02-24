// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gestao_eventos/presentation/painels/admin/create_tipo_evento/bloc/bloc.dart';

void main() {
  group('CreateTipoEventoBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          CreateTipoEventoBloc(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final createTipoEventoBloc = CreateTipoEventoBloc();
      expect(
          createTipoEventoBloc.state.customProperty, equals('Default Value'));
    });

    blocTest<CreateTipoEventoBloc, CreateTipoEventoState>(
      'CustomCreateTipoEventoEvent emits nothing',
      build: CreateTipoEventoBloc.new,
      act: (bloc) => bloc.add(const AddTipoEventoEvent()),
      expect: () => <CreateTipoEventoState>[],
    );
  });
}
