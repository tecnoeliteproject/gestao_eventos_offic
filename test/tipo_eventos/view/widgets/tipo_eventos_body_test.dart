// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gestao_eventos/presentation/painels/admin/tipo_eventos/tipo_eventos.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TipoEventosBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => TipoEventosBloc(),
          child: MaterialApp(home: TipoEventosBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
