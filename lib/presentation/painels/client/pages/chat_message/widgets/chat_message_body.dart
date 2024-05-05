// ignore_for_file: inference_failure_on_instance_creation

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestao_eventos/core/dependences/get_it.dart';
import 'package:gestao_eventos/domain/entities/user.dart' as localUser;
import 'package:gestao_eventos/presentation/painels/client/pages/chat_message/cubit/create_new_channel_cubit.dart';
import 'package:gestao_eventos/presentation/painels/client/pages/chat_message/view/channel_page.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class ChatMessageBody extends StatefulWidget {
  const ChatMessageBody({super.key});

  @override
  State<ChatMessageBody> createState() => _ChatMessageBodyState();
}

class _ChatMessageBodyState extends State<ChatMessageBody> {
  late localUser.User? currentUser;
  late List<Filter> filters;
  late final StreamChatClient client;
  late final StreamChannelListController channelListController;
  final _membersChatFilter = <Object>[];

  @override
  void initState() {
    client = getIt<StreamChatClient>();
    currentUser = getIt<localUser.User>();
    _populateChatFilter();

    channelListController = StreamChannelListController(
      client: client,
      filter: _chatFilter(),
      channelStateSort: const [SortOption('last_message_at')],
    );

    super.initState();
  }

  Filter? _chatFilter() {
    final filter = _membersChatFilter.isNotEmpty
        ? Filter.in_(
            'members',
            _membersChatFilter,
          )
        : null;
    return filter;
  }

  @override
  void dispose() {
    channelListController.dispose();
    super.dispose();
  }

  void _populateChatFilter() {
    if (currentUser != null && currentUser!.level != localUser.User.ADMIN) {
      _membersChatFilter.add(StreamChat.of(context).currentUser!.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateNewChannelCubit, CreateNewChannelState>(
      listener: (context, state) {
        if (state is CreateNewChanneSuccess) {}
      },
      buildWhen: (_, current) => current is CreateNewChanneSuccess,
      builder: (context, state) => Scaffold(
        body: StreamBuilder<List<Channel>>(
          stream: client.queryChannels(
            filter: _chatFilter(),
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
                    builder: (_) => StreamChannel(
                      channel: channel,
                      child: ChannelPage(
                        client: client,
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
        floatingActionButton: _buildFAB(context),
      ),
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
