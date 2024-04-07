// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gestao_eventos/presentation/painels/admin/gestao_stock/gestao_stock.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GestaoStockPage', () {
    group('route', () {
      test('is routable', () {
        expect(GestaoStockPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders GestaoStockView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: GestaoStockPage()));
      expect(find.byType(GestaoStockView), findsOneWidget);
    });
  });
}
