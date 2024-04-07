part of 'channel_item_bloc.dart';

sealed class ChannelItemEvent extends Equatable {
  const ChannelItemEvent();

  @override
  List<Object> get props => [];
}

class GetLastMessageEvent extends ChannelItemEvent{}