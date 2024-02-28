part of 'client_chat_message_bloc.dart';

sealed class ClientChatMessageState extends Equatable {
  const ClientChatMessageState();
  
  @override
  List<Object> get props => [];
}

final class ClientMessageInitialState extends ClientChatMessageState {}
final class GettingClientMessagesState extends ClientChatMessageState {}
final class GotClientMessagesSucessState extends ClientChatMessageState {
  GotClientMessagesSucessState({required this.messages});

  final List<ChatMessage> messages;
}
final class ErrorOnGetClientMessagesState extends ClientChatMessageState {
  ErrorOnGetClientMessagesState({required this.message});

  final String message;
}

class SendingMessageState extends ClientChatMessageState {}

class SentMessageSucessState extends ClientChatMessageState {
  SentMessageSucessState({required this.messages, required this.message});
  final List<ChatMessage> messages;
  final ChatMessage message;
}

class ErrorOnSendMessageState extends ClientChatMessageState {
  ErrorOnSendMessageState({required this.message});

  final String message;
}