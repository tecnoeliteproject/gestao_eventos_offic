// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gestao_eventos/presentation/painels/admin/tipo_eventos/tipo_eventos.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TipoEventosPage', () {
    group('route', () {
      test('is routable', () {
        expect(TipoEventosPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders TipoEventosView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: TipoEventosPage()));
      expect(find.byType(TipoEventosView), findsOneWidget);
    });
  });
}
