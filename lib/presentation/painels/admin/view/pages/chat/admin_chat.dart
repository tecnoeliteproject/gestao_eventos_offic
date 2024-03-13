import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gestao_eventos/core/helpers/constants.dart';
import 'package:gestao_eventos/domain/entities/chat_message.dart';
import 'package:gestao_eventos/presentation/painels/admin/product_details/product_details.dart';
import 'package:gestao_eventos/presentation/painels/admin/view/pages/chat/bloc/admin_chat_message_bloc.dart';

class AdminChat extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AdminChatState();
  }
}

class _AdminChatState extends State<AdminChat> {
  @override
  void initState() {
    super.initState();
    initDependencies();
    _bloc.add(GetAdminMessageSendersEvent());
  }

  void initDependencies() {
    _bloc = BlocProvider.of<AdminChatMessageBloc>(context);
    _controller = TextEditingController();
  }

  late AdminChatMessageBloc _bloc;
  late TextEditingController _controller;
  List<ChatMessage> messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seu Chat'),
      ),
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: BlocBuilder<AdminChatMessageBloc, AdminChatMessageState>(
              bloc: _bloc,
              builder: (context, state) {
                if (state is GettingAdminMessagesState) {
                  return Center(child: CircularProgressIndicator());
                }
                if (state is ErrorOnGetAdminMessagesState) {
                  return Center(child: Text(state.message));
                }
                if (state is GotAdminMessagesSucessState) {
                  messages = state.messages;
                }

                if (messages.isEmpty) {
                  return Center(child: Text('Sem mensagens'));
                }
                return ListView.builder(
                  itemCount: messages.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.only(
                          left: 14, right: 14, top: 10, bottom: 10),
                      child: Align(
                        alignment:
                            (messages[index].messageType == MessageType.sender
                                ? Alignment.topLeft
                                : Alignment.topRight),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: (messages[index].messageType ==
                                    MessageType.sender
                                ? Colors.grey.shade200
                                : kChatColor),
                          ),
                          padding: EdgeInsets.all(16),
                          child: Text(
                            messages[index].message,
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              margin: const EdgeInsets.all(20),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: BlocBuilder<AdminChatMessageBloc, AdminChatMessageState>(
                      bloc: _bloc,
                      builder: (context, state) {
                        return TextField(
                          controller: _controller,
                          decoration: const InputDecoration(
                              hintText: 'Escrever mensagem',
                              hintStyle: TextStyle(color: Colors.black54),
                              border: InputBorder.none),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  BlocBuilder<AdminChatMessageBloc, AdminChatMessageState>(
                    bloc: _bloc,
                    builder: (context, state) {
                      if (state is SendingMessageState) {
                        return CircularProgressIndicator();
                      }
                      if (state is ErrorOnSendMessageState) {
                        return Text(state.message);
                      }
                      if (state is SentMessageSucessState) {
                        _controller.clear();
                      }
                      if (state is GotAdminMessagesSucessState) {
                        messages = state.messages;
                      }
                      return FloatingActionButton(
                        onPressed: () {
                          if (_controller.text.isNotEmpty) {
                            _bloc.add(SendAdminMessageEvent(
                                message: _controller.text, messages: messages));
                            _controller.clear();
                          }
                        },
                        child: Icon(
                          Icons.send,
                          color: Colors.white,
                          size: 18,
                        ),
                        backgroundColor: kPrimaryColor,
                        elevation: 0,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
