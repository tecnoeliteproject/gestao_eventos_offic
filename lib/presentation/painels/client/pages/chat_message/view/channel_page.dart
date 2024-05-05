import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class ChannelPage extends StatelessWidget {
  const ChannelPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamChatTheme(
      data: StreamChatThemeData(),
      child: Scaffold(
        appBar: StreamChannelHeader(showConnectionStateTile: true),
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
            StreamMessageInput(),
          ],
        ),
      ),
    );
  }
}
