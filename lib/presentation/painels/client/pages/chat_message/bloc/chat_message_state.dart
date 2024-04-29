part of 'chat_message_bloc.dart';

/// {@template chat_message_state}
/// ChatMessageState description
/// {@endtemplate}
class ChatMessageState extends Equatable {
  /// {@macro chat_message_state}
  const ChatMessageState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current ChatMessageState with property changes
  ChatMessageState copyWith({
    String? customProperty,
  }) {
    return ChatMessageState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

/// {@template chat_message_initial}
/// The initial state of ChatMessageState
/// {@endtemplate}
class ChatMessageInitial extends ChatMessageState {
  /// {@macro chat_message_initial}
  const ChatMessageInitial() : super();
}

class ChatMessageSuccess extends ChatMessageState {
  /// {@macro chat_message_initial}
  const ChatMessageSuccess() : super();
}

class ChatMessageLoading extends ChatMessageState {
  /// {@macro chat_message_initial}
  const ChatMessageLoading() : super();
}
