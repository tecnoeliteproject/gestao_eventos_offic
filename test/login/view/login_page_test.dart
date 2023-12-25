// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gestao_eventos/presentation/login/login.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LoginPage', () {
    group('route', () {
      test('is routable', () {
        expect(SignInPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders LoginView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: SignInPage()));
      expect(find.byType(LoginView), findsOneWidget);
    });
  });
}
