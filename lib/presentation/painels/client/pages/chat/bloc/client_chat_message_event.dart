part of 'client_chat_message_bloc.dart';

sealed class ClientChatMessageEvent extends Equatable {
  const ClientChatMessageEvent();

  @override
  List<Object> get props => [];
}

class GetClientMessagesEvent extends ClientChatMessageEvent {}
class SendMessageEvent extends ClientChatMessageEvent {
  final String message;
  final List<ChatMessage> messages;
  const SendMessageEvent({required this.messages, required this.message});
}