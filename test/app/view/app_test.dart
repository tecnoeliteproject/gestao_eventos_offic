<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gestao_eventos/presentation/app/app.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(Placeholder), findsOneWidget);
    });
  });
}
=======
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gestao_eventos/presentation/app/app.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(Placeholder), findsOneWidget);
    });
  });
}
>>>>>>> 9c1fb90644301fea5aadcc0ac7058a394f50e020
