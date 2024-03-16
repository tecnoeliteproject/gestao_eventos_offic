// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gestao_eventos/presentation/painels/client/pages/tipo_evento_detail/tipo_evento_detail.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TipoEventoDetailBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => TipoEventoDetailBloc(),
          child: MaterialApp(home: TipoEventoDetailBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
