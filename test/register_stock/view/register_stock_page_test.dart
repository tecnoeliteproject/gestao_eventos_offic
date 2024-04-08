// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gestao_eventos/presentation/painels/admin/register_stock/register_stock.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('RegisterStockPage', () {
    group('route', () {
      test('is routable', () {
        expect(RegisterStockPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders RegisterStockView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: RegisterStockPage()));
      expect(find.byType(RegisterStockView), findsOneWidget);
    });
  });
}
