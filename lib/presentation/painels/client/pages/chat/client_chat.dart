import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gestao_eventos/core/helpers/constants.dart';
import 'package:gestao_eventos/domain/entities/chat_message.dart';
import 'package:gestao_eventos/presentation/painels/admin/product_details/product_details.dart';
import 'package:gestao_eventos/presentation/painels/client/pages/chat/bloc/client_chat_message_bloc.dart';

class ClientChat extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ClientChatState();
  }
}

class _ClientChatState extends State<ClientChat> {
  @override
  void initState() {
    super.initState();
    initDependencies();
    _bloc.add(GetClientMessagesEvent());
  }

  void initDependencies() {
    _bloc = ClientChatMessageBloc();
    _controller = TextEditingController();
  }

  late ClientChatMessageBloc _bloc;
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
            child: BlocBuilder<ClientChatMessageBloc, ClientChatMessageState>(
              bloc: _bloc,
              builder: (context, state) {
                if (state is GettingClientMessagesState) {
                  return Center(child: CircularProgressIndicator());
                }
                if (state is ErrorOnGetClientMessagesState) {
                  return Center(child: Text(state.message));
                }
                if (state is GotClientMessagesSucessState) {
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
                            (messages[index].messageType == MessageType.receiver
                                ? Alignment.topLeft
                                : Alignment.topRight),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: (messages[index].messageType ==
                                    MessageType.receiver
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
              margin: EdgeInsets.all(20),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: BlocBuilder<ClientChatMessageBloc, ClientChatMessageState>(
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
                  SizedBox(
                    width: 15,
                  ),
                  BlocBuilder<ClientChatMessageBloc, ClientChatMessageState>(
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
                      if (state is GotClientMessagesSucessState) {
                        messages = state.messages;
                      }
                      return FloatingActionButton(
                        onPressed: () {
                          if (_controller.text.isNotEmpty) {
                            _bloc.add(SendMessageEvent(
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
