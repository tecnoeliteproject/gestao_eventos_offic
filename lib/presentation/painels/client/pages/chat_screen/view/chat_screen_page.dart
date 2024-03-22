import 'package:flutter/material.dart';
import 'package:gestao_eventos/presentation/painels/client/pages/chat_screen/bloc/bloc.dart';
import 'package:gestao_eventos/presentation/painels/client/pages/chat_screen/widgets/chat_screen_body.dart';

/// {@template chat_screen_page}
/// A description for ChatScreenPage
/// {@endtemplate}
class ClientChatScreenPage extends StatelessWidget {
  /// {@macro chat_screen_page}
  const ClientChatScreenPage({super.key});

  /// The static route for ChatScreenPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const ClientChatScreenPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ClientChatScreenBloc(),
      child: const Scaffold(
        body: ChatScreenView(),
      ),
    );
  }
}

/// {@template chat_screen_view}
/// Displays the Body of ChatScreenView
/// {@endtemplate}
class ChatScreenView extends StatelessWidget {
  /// {@macro chat_screen_view}
  const ChatScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ClientChatScreenBody();
  }
}
