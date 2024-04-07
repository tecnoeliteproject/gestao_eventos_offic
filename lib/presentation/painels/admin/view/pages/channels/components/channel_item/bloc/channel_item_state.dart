part of 'channel_item_bloc.dart';

sealed class ChannelItemState extends Equatable {
  const ChannelItemState();
  
  @override
  List<Object> get props => [];
}

final class ChannelItemInitialState extends ChannelItemState {}
final class GettingLastMessageState extends ChannelItemState {}
final class GotLastMessageState extends ChannelItemState {}
final class ErrorOnGetLastMessageState extends ChannelItemState {}
