import 'package:flutter/material.dart';
import 'package:gestao_eventos/presentation/auth/sign_in/components/sign_form.dart';
import 'package:gestao_eventos/presentation/general_components/no_account_text.dart';
import 'package:gestao_eventos/presentation/general_components/socal_card.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  static const String routeName = '/sign_in_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  const Text(
                    'Event-Gest',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Faça login com email e senha  \nou continue com o google',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  const SignForm(),
                  const SizedBox(height: 16),
                  // SocalCard(
                  //   icon: 'assets/icons/google-icon.svg',
                  //   press: () {},
                  // ),
                  const SizedBox(height: 20),
                  const NoAccountText(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
