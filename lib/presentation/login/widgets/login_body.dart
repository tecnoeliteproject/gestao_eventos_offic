import 'package:flutter/material.dart';
import 'package:gestao_eventos/presentation/login/bloc/bloc.dart';

/// {@template login_body}
/// Body of the LoginPage.
///
/// Add what it does
/// {@endtemplate}
class LoginBody extends StatelessWidget {
  /// {@macro login_body}
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Center(child: Text(state.customProperty));
      },
    );
  }
}
