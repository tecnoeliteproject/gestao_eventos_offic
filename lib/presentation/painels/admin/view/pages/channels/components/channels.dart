import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestao_eventos/domain/entities/user.dart';
import 'package:gestao_eventos/presentation/painels/admin/view/pages/chat/bloc/admin_chat_message_bloc.dart';
import 'package:gestao_eventos/presentation/painels/admin/view/pages/chat/conversation/conversation_item.dart';

class ChannelsPage extends StatefulWidget {
  ChannelsPage({Key? key}) : super(key: key);

  @override
  _ChannelsPageState createState() => _ChannelsPageState();
}

class _ChannelsPageState extends State<ChannelsPage> {
  @override
  void initState() {
    super.initState();
    initDependencies();
  }

  void initDependencies() {
    _bloc = BlocProvider.of<AdminChatMessageBloc>(context);
    _bloc.add(GetAdminMessageSendersEvent());
  }

  late AdminChatMessageBloc _bloc;
  List<User> messagersUsers = [];

  @override
  Widget build(BuildContext context) {
    return BlocListener<AdminChatMessageBloc, AdminChatMessageState>(
      bloc: _bloc,
      listener: (context, state) {
        if (state is GotoChatState){
          _bloc.add(GetAdminMessagesEvent(senderEmail: state.user.email!));
        }
      },
      child: Scaffold(
          body: BlocBuilder<AdminChatMessageBloc, AdminChatMessageState>(
        bloc: _bloc,
        builder: (context, state) {
          if (state is GettingAdminMessageSendersState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is ErrorOnGetMessageSendersState) {
            return Center(child: Text(state.message));
          }
          if (state is GotMessageSendersState) {
            messagersUsers = state.users;
          }

          if (messagersUsers.isEmpty) {
            return const Center(child: Text('Sem conversas'));
          }

          return ListView.builder(
            itemCount: messagersUsers.length,
            shrinkWrap: true,
            padding: EdgeInsets.only(top: 16),
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  _bloc.add(GotoChatEvent(user: messagersUsers[index]));
                },
                child: ConversationItem(
                  name: messagersUsers[index].email!,
                  messageText: messagersUsers[index].email!,
                  time: messagersUsers[index].email!,
                  isMessageRead: (index == 0 || index == 3) ? true : false,
                ),
              );
            },
          );
        },
      )),
    );
  }
}
