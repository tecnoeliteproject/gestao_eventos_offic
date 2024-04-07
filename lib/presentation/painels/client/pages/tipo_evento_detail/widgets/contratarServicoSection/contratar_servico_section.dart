// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:gestao_eventos/core/helpers/constants.dart';
import 'package:gestao_eventos/presentation/painels/client/pages/chat_screen/view/chat_screen_page.dart';

class ContratarServicoSection extends StatelessWidget {
  const ContratarServicoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            LigarWidget(
              icon: const Icon(
                FontAwesomeIcons.message,
                color: Colors.green,
              ),
              onTap: () {
                _openChatScreen(context);
              },
            ),
            const Gutter(),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Contratar Serviço'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _openChatScreen(BuildContext context) {
    Navigator.push(
      context,
      ClientChatScreenPage.route(),
    );
  }
}

class LigarWidget extends StatelessWidget {
  const LigarWidget({
    required this.icon,
    super.key,
    this.onTap,
  });

  final Widget icon;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          border: Border.fromBorderSide(
            BorderSide(
              color: Colors.green,
            ),
          ),
        ),
        child: IconButton(
          onPressed: onTap,
          icon: icon,
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }
}
