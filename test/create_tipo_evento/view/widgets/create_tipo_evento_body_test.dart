// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gestao_eventos/presentation/painels/admin/create_tipo_evento/create_tipo_evento.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CreateTipoEventoBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => CreateTipoEventoBloc(),
          child: MaterialApp(home: CreateTipoEventoBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
