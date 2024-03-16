import 'package:flutter/material.dart';
import 'package:gestao_eventos/presentation/painels/client/pages/tipo_evento_detail/widgets/headerSection/header_section_widget.dart';

/// {@template tipo_evento_detail_body}
/// Body of the TipoEventoDetailPage.
///
/// Add what it does
/// {@endtemplate}
class TipoEventoDetailBody extends StatelessWidget {
  /// {@macro tipo_evento_detail_body}
  const TipoEventoDetailBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          HeaderSection(),
        ],
      ),
    );
  }
}
