import 'package:flutter/material.dart';
import 'package:gestao_eventos/presentation/painels/client/pages/chat/client_chat.dart';

/// {@template chat_screen_body}
/// Body of the ChatScreenPage.
///
/// Add what it does
/// {@endtemplate}
class ClientChatScreenBody extends StatelessWidget {
  /// {@macro chat_screen_body}
  const ClientChatScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const ClientChat();
  }
}
