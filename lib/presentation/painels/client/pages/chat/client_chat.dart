import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gestao_eventos/core/helpers/constants.dart';
import 'package:gestao_eventos/domain/entities/message.dart';

class ClientChat extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ClientChatState();
  }
}

List<ChatMessage> messages = [
  ChatMessage(messageContent: 'Hello, Will', messageType: MessageType.receiver),
  ChatMessage(
      messageContent: 'How have you been?', messageType: MessageType.receiver),
  ChatMessage(
      messageContent: 'Hey Kriss, I am doing fine dude. wbu?',
      messageType: MessageType.seder),
  ChatMessage(
      messageContent: 'ehhhh, doing OK.', messageType: MessageType.receiver),
  ChatMessage(
      messageContent: 'Is there any thing wrong?',
      messageType: MessageType.seder),
];

class _ClientChatState extends State<ClientChat> {
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
            child: ListView.builder(
              itemCount: messages.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 10, bottom: 10),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
                  child: Align(
                    alignment: (messages[index].messageType == MessageType.receiver?Alignment.topLeft:Alignment.topRight),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: (messages[index].messageType  == MessageType.receiver ?Colors.grey.shade200:kChatColor),
                      ),
                      padding: EdgeInsets.all(16),
                      child: Text(messages[index].messageContent, style: TextStyle(fontSize: 15),),
                    ),
                  ),
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
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Write message...',
                          hintStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  FloatingActionButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 18,
                    ),
                    backgroundColor: kPrimaryColor,
                    elevation: 0,
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
