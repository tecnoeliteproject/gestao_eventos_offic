// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gestao_eventos/presentation/home/home.dart';

void main() {
  group('HomePage', () {
    group('route', () {
      test('is routable', () {
        // ignore: strict_raw_type
        expect(HomePage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders HomeView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: HomePage()));
      expect(find.byType(HomeView), findsOneWidget);
    });
  });
}
