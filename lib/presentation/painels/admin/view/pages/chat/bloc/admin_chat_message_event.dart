part of 'admin_chat_message_bloc.dart';

sealed class AdminChatMessageEvent extends Equatable {
  const AdminChatMessageEvent();

  @override
  List<Object> get props => [];
}

class GetAdminMessagesEvent extends AdminChatMessageEvent {
  GetAdminMessagesEvent({required this.senderEmail});

  final String senderEmail;
}

class GetAdminMessageSendersEvent extends AdminChatMessageEvent {}

class GotoChatEvent extends AdminChatMessageEvent {
  final User user;
  const GotoChatEvent({required this.user});
}

class SendAdminMessageEvent extends AdminChatMessageEvent {
  final String message;
  final List<ChatMessage> messages;
  const SendAdminMessageEvent({required this.messages, required this.message});
}
