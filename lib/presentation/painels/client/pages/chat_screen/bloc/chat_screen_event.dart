part of 'chat_screen_bloc.dart';

abstract class ChatScreenEvent  extends Equatable {
  const ChatScreenEvent();

  @override
  List<Object> get props => [];

}

/// {@template custom_chat_screen_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomChatScreenEvent extends ChatScreenEvent {
  /// {@macro custom_chat_screen_event}
  const CustomChatScreenEvent();
}
