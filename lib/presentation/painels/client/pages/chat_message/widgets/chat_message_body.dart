import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestao_eventos/core/dependences/get_it.dart';
import 'package:gestao_eventos/domain/entities/user.dart';
import 'package:gestao_eventos/presentation/painels/client/pages/chat_message/cubit/create_new_channel_cubit.dart';
import 'package:gestao_eventos/presentation/painels/client/pages/chat_message/view/channel_page.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart' hide User;

class ChatMessageBody extends StatefulWidget {
  const ChatMessageBody({super.key});

  @override
  State<ChatMessageBody> createState() => _ChatMessageBodyState();
}

class _ChatMessageBodyState extends State<ChatMessageBody> {
  late User? currentUser;
  late List<Filter> filters;
  late final StreamChatClient client;
  late final StreamChannelListController channelListController;

  @override
  void initState() {
    client = getIt<StreamChatClient>();
    currentUser = getIt<User>();
    channelListController = StreamChannelListController(
      client: client,
      filter: Filter.in_(
        'members',
        [StreamChat.of(context).currentUser!.id],
      ),
      channelStateSort: const [SortOption('last_message_at')],
    );

    super.initState();
  }

  @override
  void dispose() {
    channelListController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateNewChannelCubit, CreateNewChannelState>(
      listener: (context, state) {
        if (state is CreateNewChanneSuccess) {}
      },
      buildWhen: (_, current) => current is CreateNewChanneSuccess,
      builder: (context, state) => Scaffold(
        body: _buildBody(),
        floatingActionButton: _buildFAB(context),
      ),
    );
  }

  StreamBuilder<List<Channel>> _buildBody() {
    return StreamBuilder<List<Channel>>(
      stream: client.queryChannels(
        filter: Filter.in_(
          'members',
          [StreamChat.of(context).currentUser!.id],
        ),
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.hasError) {
          return Center(
            child: Text('Ocorreu um erro: ${snapshot.error}'),
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            channelListController.channels = snapshot.data!;
          }
        }

        return StreamChannelListView(
          controller: channelListController,
          onChannelTap: (channel) {
            Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (_) => StreamChat(
                  client: client,
                  child: StreamChannel(
                    channel: channel,
                    child: const ChannelPage(),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  FloatingActionButton _buildFAB(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        context.read<CreateNewChannelCubit>().createNewChannel('Canal teste');
      },
    );
  }
}
