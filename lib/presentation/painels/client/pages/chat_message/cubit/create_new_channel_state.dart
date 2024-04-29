part of 'create_new_channel_cubit.dart';

sealed class CreateNewChannelState extends Equatable {
  const CreateNewChannelState();

  @override
  List<Object> get props => [];
}

final class CreateNewChannelInitial extends CreateNewChannelState {}

final class CreateNewChannelLoading extends CreateNewChannelState {}

final class CreateNewChanneSuccess extends CreateNewChannelState {
  const CreateNewChanneSuccess(this.channelState);

  final ChannelState channelState;

  @override
  List<Object> get props => [channelState];
}

final class CreateNewChanneError extends CreateNewChannelState {
  const CreateNewChanneError(this.error);
  final String error;

  @override
  List<Object> get props => [error];
}
