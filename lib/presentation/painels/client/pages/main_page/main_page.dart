import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:gestao_eventos/core/helpers/constants.dart';
import 'package:gestao_eventos/presentation/painels/client/pages/main_page/components/discount_banner.dart';
import 'package:gestao_eventos/presentation/painels/client/pages/main_page/components/home_header.dart';
import 'package:gestao_eventos/presentation/painels/client/pages/main_page/components/special_offers.dart';
import 'package:gestao_eventos/presentation/painels/client/pages/main_page/components/tipoEventos/tipo_eventos_section.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});
  static String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
          child: Column(
            children: [
              HomeHeader(),
              DiscountBanner(),
              // Categories(),
              SpecialOffers(),
              GutterLarge(),
              TipoEventosSection(),
              GutterLarge(),
            ],
          ),
        ),
      ),
    );
  }
}
