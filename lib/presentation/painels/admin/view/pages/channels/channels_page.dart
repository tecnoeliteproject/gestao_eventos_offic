import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestao_eventos/core/helpers/date_time.dart';
import 'package:gestao_eventos/core/helpers/generic_functions.dart';
import 'package:gestao_eventos/domain/entities/chat_message.dart';
import 'package:gestao_eventos/presentation/painels/admin/view/pages/channels/bloc/channels_bloc.dart';
import 'package:gestao_eventos/presentation/painels/admin/view/pages/channels/components/channel_item.dart';
import 'package:gestao_eventos/presentation/painels/client/pages/chat/client_chat.dart';

class ChannelsPage extends StatefulWidget {
  ChannelsPage({required this.messages});

  final List<ChatMessage> messages;
  @override
  State<ChannelsPage> createState() {
    return ChannelsPageSatate(messages: messages);
  }
}

class ChannelsPageSatate extends State<ChannelsPage> {
  ChannelsPageSatate({required this.messages});

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<ChannelsBloc>(context);
    _bloc.add(GetChannelsEvent());
  }

  late ChannelsBloc _bloc;

  List<ChatMessage> messages = [];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChannelsBloc, ChannelsState>(
      builder: (context, state) {
        if (state is GettingChannelsState) {
          return const LinearProgressIndicator();
        }
        if (state is GotChannelsState) {
          messages = state.messages;
        }
        if (state is ErrorOnGetChannelsState) {
          return Text(state.messages);
        }
        return ListView.builder(
          itemCount: messages.length,
          shrinkWrap: true,
          padding: const EdgeInsets.only(top: 16),
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                showLog(messsage: 'messsage');
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const ClientChat();
                  },
                ));
              },
              child: ChannelItem(
                name: messages[index].sender?.name ?? 'Usuário sem nome',
                messageText: messages[index].message,
                time: DataTimeHelper.dataToText(messages[index].dateTime),
                isMessageRead: (index == 0 || index == 3) ? true : false,
              ),
            );
          },
        );
      },
    );
  }
}
