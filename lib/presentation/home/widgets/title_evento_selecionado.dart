import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gestao_eventos/presentation/global_widgets/default_padding_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleEventoSelecionadoWidget extends StatelessWidget {
  const TitleEventoSelecionadoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultPaddingWidget(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Casamentos',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Icon(FontAwesomeIcons.chevronRight),
        ],
      ),
    );
  }
}
