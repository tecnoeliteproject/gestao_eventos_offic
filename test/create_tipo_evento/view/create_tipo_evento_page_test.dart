// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gestao_eventos/presentation/painels/admin/create_tipo_evento/create_tipo_evento.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CreateTipoEventoPage', () {
    group('route', () {
      test('is routable', () {
        expect(CreateTipoEventoPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders CreateTipoEventoView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: CreateTipoEventoPage()));
      expect(find.byType(CreateTipoEventoView), findsOneWidget);
    });
  });
}
