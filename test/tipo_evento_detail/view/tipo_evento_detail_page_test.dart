// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gestao_eventos/presentation/painels/client/pages/tipo_evento_detail/tipo_evento_detail.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TipoEventoDetailPage', () {
    group('route', () {
      test('is routable', () {
        expect(TipoEventoDetailPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders TipoEventoDetailView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: TipoEventoDetailPage()));
      expect(find.byType(TipoEventoDetailView), findsOneWidget);
    });
  });
}
