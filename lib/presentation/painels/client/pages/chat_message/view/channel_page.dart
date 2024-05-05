import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class ChannelPage extends StatelessWidget {
  const ChannelPage({
    required this.client,
    super.key,
  });

  final StreamChatClient client;

  @override
  Widget build(BuildContext context) {
    return StreamChat(
      client: client,
      useMaterial3: true,
      child: StreamChatTheme(
        data: StreamChatThemeData(),
        child: Scaffold(
          appBar: const StreamChannelHeader(showConnectionStateTile: true),
          body: Column(
            children: <Widget>[
              Expanded(
                child: StreamMessageListView(
                  messageBuilder:
                      (context, messageDetails, messageList, defaultWidget) {
                    return defaultWidget.copyWith(
                      reverse: true,
                    );
                  },
                ),
              ),
              const StreamMessageInput(),
            ],
          ),
        ),
      ),
    );
  }
}
