part of 'admin_chat_message_bloc.dart';

sealed class AdminChatMessageState extends Equatable {
  const AdminChatMessageState();
  
  @override
  List<Object> get props => [];
}

final class AdminMessageInitialState extends AdminChatMessageState {}
final class GettingAdminMessagesState extends AdminChatMessageState {}
final class GotAdminMessagesSucessState extends AdminChatMessageState {
  GotAdminMessagesSucessState({required this.messages});

  final List<ChatMessage> messages;
}

final class GettingAdminMessageSendersState extends AdminChatMessageState {
}

final class GotMessageSendersState extends AdminChatMessageState {
  GotMessageSendersState({required this.users});

  final List<User> users;
}
final class ErrorOnGetAdminMessagesState extends AdminChatMessageState {
  ErrorOnGetAdminMessagesState({required this.message});

  final String message;
}
final class ErrorOnGetMessageSendersState extends AdminChatMessageState {
  ErrorOnGetMessageSendersState({required this.message});

  final String message;
}

class SendingMessageState extends AdminChatMessageState {}

class SentMessageSucessState extends AdminChatMessageState {
  SentMessageSucessState({required this.messages, required this.message});
  final List<ChatMessage> messages;
  final ChatMessage message;
}

class ErrorOnSendMessageState extends AdminChatMessageState {
  ErrorOnSendMessageState({required this.message});

  final String message;
}

class GotoChatState extends AdminChatMessageState {
  final User user;
  const GotoChatState({required this.user});
}