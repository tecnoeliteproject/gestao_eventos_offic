// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gestao_eventos/presentation/painels/admin/gestao_stock/gestao_stock.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GestaoStockBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => GestaoStockBloc(),
          child: MaterialApp(home: GestaoStockBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
