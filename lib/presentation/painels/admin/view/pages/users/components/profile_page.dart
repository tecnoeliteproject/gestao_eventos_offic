import 'package:flutter/material.dart';
import 'package:gestao_eventos/presentation/general_components/profile_page/components/profile_menu.dart';
import 'package:gestao_eventos/presentation/general_components/profile_page/components/profile_pic.dart';

class ProfileAdminPage extends StatelessWidget {
  const ProfileAdminPage({
    required this.onSigningOut,
    super.key,
  });

  final Function? onSigningOut;
  static String routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            const ProfilePic(),
            const SizedBox(height: 20),
            ProfileMenu(
              text: 'Minha Conta',
              icon: 'assets/icons/User Icon.svg',
              press: () => {},
            ),
            ProfileMenu(
              text: 'Sair',
              icon: 'assets/icons/Log out.svg',
              // ignore: avoid_dynamic_calls
              press: () => onSigningOut?.call(),
            ),
          ],
        ),
      ),
    );
  }
}
