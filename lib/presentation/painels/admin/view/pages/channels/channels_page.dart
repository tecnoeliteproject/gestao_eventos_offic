import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestao_eventos/core/dependences/get_it.dart';
import 'package:gestao_eventos/core/helpers/date.dart';
import 'package:gestao_eventos/domain/entities/chat_message.dart';
import 'package:gestao_eventos/presentation/painels/admin/bloc/admin_event.dart';
import 'package:gestao_eventos/presentation/painels/admin/bloc/bloc.dart';
import 'package:gestao_eventos/presentation/painels/admin/view/pages/channels/bloc/channels_bloc.dart';
import 'package:gestao_eventos/presentation/painels/admin/view/pages/channels/components/channel_item/channel_item.dart';

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
    _initDependencies();
    super.initState();
  }

  void _initDependencies() {
    _bloc = getIt<ChannelsBloc>();
    _bloc.add(GetChannelsEvent());
  }

  late ChannelsBloc _bloc;

  List<ChatMessage> messages = [];
  @override
  Widget build(BuildContext context) {
    return BlocListener<ChannelsBloc, ChannelsState>(
      bloc: _bloc,
      listener: (context, state) {
        
      },
      child: BlocBuilder<ChannelsBloc, ChannelsState>(
        bloc: _bloc,
        builder: (context, state) {
          if (state is GettingChannelsState) {
            return const LinearProgressIndicator();
          }
          if (state is GotChannelsState) {
            messages = state.chatMessage;
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
                  getIt<AdminBloc>().userSender = messages[index].sender;
                  getIt<AdminBloc>().add(ChangeAdminPageEvent(
                      data: messages[index].sender, index: 3));
                },
                child: ChannelItem(
                  name: messages[index].sender?.name ?? 'Sem nome',
                  messageText: messages[index].message,
                  time: DateTimeHelper.dateToRecentTextDescription(
                      messages[index].dateTime),
                  isMessageRead: (index == 0 || index == 3) ? true : false,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
