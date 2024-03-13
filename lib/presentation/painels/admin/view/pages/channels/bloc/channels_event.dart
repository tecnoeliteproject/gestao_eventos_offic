part of 'channels_bloc.dart';

sealed class ChannelsEvent extends Equatable {
  const ChannelsEvent();

  @override
  List<Object> get props => [];
}

class GetChannelsEvent extends ChannelsEvent {}
class GetLastMassageChannelEvent extends ChannelsEvent {
  final ChatMessage chatMessage;

  GetLastMassageChannelEvent({required this.chatMessage});
}