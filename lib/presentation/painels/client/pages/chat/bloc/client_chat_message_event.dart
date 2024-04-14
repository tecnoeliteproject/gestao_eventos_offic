part of 'client_chat_message_bloc.dart';

sealed class ClientChatMessageEvent extends Equatable {
  const ClientChatMessageEvent();

  @override
  List<Object> get props => [];
}

class GetClientMessagesEvent extends ClientChatMessageEvent {
  final User? user;
  const GetClientMessagesEvent({this.user});
}

class ChooseFileEvent extends ClientChatMessageEvent {}
class SendFileEvent extends ClientChatMessageEvent {
  final Uint8List file;
  final List<ChatMessage> messages;
  final User? user;
  const SendFileEvent({this.user, required this.messages, required this.file});
}

class SendMessageEvent extends ClientChatMessageEvent {
  final String message;
  final List<ChatMessage> messages;
  final User? user;
  const SendMessageEvent(
      {this.user, required this.messages, required this.message});
}
