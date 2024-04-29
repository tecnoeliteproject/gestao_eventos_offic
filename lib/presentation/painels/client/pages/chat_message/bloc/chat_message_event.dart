part of 'chat_message_bloc.dart';

abstract class ChatMessageEvent  extends Equatable {
  const ChatMessageEvent();

  @override
  List<Object> get props => [];

}

/// {@template custom_chat_message_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomChatMessageEvent extends ChatMessageEvent {
  /// {@macro custom_chat_message_event}
  const CustomChatMessageEvent();
}
