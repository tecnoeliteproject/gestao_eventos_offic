import 'package:flutter_test/flutter_test.dart';
import 'package:gestao_eventos/presentation/painels/client/pages/tipo_evento_detail/widgets/detailsSection/details_section.dart';

void main() {
  testWidgets('details section ...', (tester) async {
    // inicializa DetailsSection
    const detailsSection = DetailsSection();

    await tester.pumpWidget(detailsSection);

    expect(find.text('56.000,00 Kz'), findsOneWidget);
  });
}
