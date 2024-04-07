part of 'channels_bloc.dart';

sealed class ChannelsState extends Equatable {
  const ChannelsState();
  
  @override
  List<Object> get props => [];
}

final class ChannelsInitialState extends ChannelsState {}

final class GettingChannelsState extends ChannelsState {}
final class GotChannelsState extends ChannelsState {
  final List<ChatMessage> chatMessage;
  const GotChannelsState({required this.chatMessage});
}
final class ErrorOnGetChannelsState extends ChannelsState {
  const ErrorOnGetChannelsState({required this.messages});
  final String messages;
}