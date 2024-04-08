// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gestao_eventos/presentation/painels/admin/register_stock/register_stock.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('RegisterStockBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => RegisterStockBloc(),
          child: MaterialApp(home: RegisterStockBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
