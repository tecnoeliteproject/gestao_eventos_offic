import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestao_eventos/core/dependences/get_it.dart';
import 'package:gestao_eventos/presentation/painels/client/pages/chat_message/bloc/chat_message_bloc.dart';
import 'package:gestao_eventos/presentation/painels/client/pages/chat_message/cubit/create_new_channel_cubit.dart';
import 'package:gestao_eventos/presentation/painels/client/pages/chat_message/widgets/chat_message_body.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class ChatMessagePage extends StatelessWidget {
  const ChatMessagePage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const ChatMessagePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ChatMessageBloc(),
        ),
        BlocProvider(
          create: (context) => CreateNewChannelCubit(),
        ),
      ],
      child: const Scaffold(
        body: ChatMessageView(),
      ),
    );
  }
}

class ChatMessageView extends StatelessWidget {
  const ChatMessageView({super.key});

  @override
  Widget build(BuildContext context) {
    final client = getIt<StreamChatClient>();

    return BlocBuilder<ChatMessageBloc, ChatMessageState>(
      bloc: context.read<ChatMessageBloc>()
        ..add(const CustomChatMessageEvent()),
      builder: (context, state) {
        print(state);
        if (state is ChatMessageLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return StreamChat(
          client: client,
          child: StreamChatTheme(
            data: StreamChatThemeData(),
            child: const ChatMessageBody(),
          ),
        );
      },
    );
  }
}
