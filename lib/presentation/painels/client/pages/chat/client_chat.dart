import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gestao_eventos/core/helpers/constants.dart';
import 'package:gestao_eventos/domain/entities/chat_message.dart';
import 'package:gestao_eventos/domain/entities/user.dart';
import 'package:gestao_eventos/presentation/painels/admin/product_details/product_details.dart';
import 'package:gestao_eventos/presentation/painels/admin/view/pages/channels/components/chat_head.dart';
import 'package:gestao_eventos/presentation/painels/client/pages/chat/bloc/client_chat_message_bloc.dart';

class ClientChat extends StatefulWidget {
  ClientChat({super.key, this.user});

  final User? user;

  @override
  State<StatefulWidget> createState() {
    return _ClientChatState(user: user);
  }
}

class _ClientChatState extends State<ClientChat> {
  _ClientChatState({this.user});

  @override
  void initState() {
    super.initState();
    initDependencies();
    _bloc.add(GetClientMessagesEvent(user: user));
  }

  void initDependencies() {
    _bloc = ClientChatMessageBloc();
    _controller = TextEditingController();
  }

  late ClientChatMessageBloc _bloc;
  late TextEditingController _controller;
  List<ChatMessage> messages = [];
  final User? user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Visibility(
          visible: user != null,
          child: ChatHead(user: user ?? User()),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: BlocBuilder<ClientChatMessageBloc, ClientChatMessageState>(
              bloc: _bloc,
              builder: (context, state) {
                if (state is GettingClientMessagesState) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is ErrorOnGetClientMessagesState) {
                  return Center(child: Text(state.message));
                }
                if (state is GotClientMessagesSucessState) {
                  messages = state.messages;
                }

                if (messages.isEmpty) {
                  return const Center(child: Text('Sem mensagens'));
                }
                return ListView.builder(
                  itemCount: messages.length,
                  // shrinkWrap: true,
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.only(
                        left: 14,
                        right: 14,
                        top: 10,
                        bottom: 10,
                      ),
                      child: Align(
                        alignment: messages[index].sender == null
                            ? (messages[index].messageType ==
                                    MessageType.receiver
                                ? Alignment.topLeft
                                : Alignment.topRight)
                            : (messages[index].messageType ==
                                    MessageType.receiver
                                ? Alignment.topRight
                                : Alignment.topLeft),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: 
                            messages[index].sender == null?
                            (messages[index].messageType ==
                                    MessageType.receiver
                                ? Colors.grey.shade200
                                : kChatColor):(messages[index].messageType ==
                                    MessageType.receiver
                                ? kChatColor
                                : Colors.grey.shade200),
                          ),
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            messages[index].message,
                            style: const TextStyle(fontSize: 15),
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
                    child: BlocBuilder<ClientChatMessageBloc,
                        ClientChatMessageState>(
                      bloc: _bloc,
                      builder: (context, state) {
                        return TextField(
                          controller: _controller,
                          decoration: const InputDecoration(
                            hintText: 'Escrever mensagem',
                            hintStyle: TextStyle(color: Colors.black54),
                            border: InputBorder.none,
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  BlocBuilder<ClientChatMessageBloc, ClientChatMessageState>(
                    bloc: _bloc,
                    builder: (context, state) {
                      if (state is SendingMessageState) {
                        return const CircularProgressIndicator();
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
                      return RawKeyboardListener(
                        focusNode: FocusNode(),
                        onKey: (RawKeyEvent event) {
                          if (event is RawKeyDownEvent &&
                              event.logicalKey == LogicalKeyboardKey.enter) {
                            _onSendMessage();
                          }
                        },
                        child: FloatingActionButton(
                          onPressed: _onSendMessage,
                          backgroundColor: kPrimaryColor,
                          elevation: 0,
                          child: const Icon(
                            Icons.send,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
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

  void _onSendMessage() {
    if (_controller.text.isNotEmpty) {
      _bloc.add(
        SendMessageEvent(
            message: _controller.text, messages: messages, user: user),
      );
      _controller.clear();
    }
  }
}
