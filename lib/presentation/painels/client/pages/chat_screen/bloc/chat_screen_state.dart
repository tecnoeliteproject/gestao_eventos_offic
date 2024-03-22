part of 'chat_screen_bloc.dart';

/// {@template chat_screen_state}
/// ChatScreenState description
/// {@endtemplate}
class ChatScreenState extends Equatable {
  /// {@macro chat_screen_state}
  const ChatScreenState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current ChatScreenState with property changes
  ChatScreenState copyWith({
    String? customProperty,
  }) {
    return ChatScreenState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

/// {@template chat_screen_initial}
/// The initial state of ChatScreenState
/// {@endtemplate}
class ChatScreenInitial extends ChatScreenState {
  /// {@macro chat_screen_initial}
  const ChatScreenInitial() : super();
}
