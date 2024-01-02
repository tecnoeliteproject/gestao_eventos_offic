import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gestao_eventos/core/helpers/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonBottomAreaWidget extends StatelessWidget {
  const ButtonBottomAreaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(kDefaultpadding / 2),
      child: Row(
        children: [
          const SizedBox(width: kDefaultpadding),
          Text(
            '25.500,00 Kz',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 19,
              fontWeight: FontWeight.w800,
            ),
          ),
          const Spacer(),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              color: Colors.black,
            ),
            padding: const EdgeInsets.symmetric(
              vertical: kDefaultpadding * 1.2,
              horizontal: kDefaultpadding * 1.8,
            ),
            child: const Icon(
              FontAwesomeIcons.basketShopping,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
