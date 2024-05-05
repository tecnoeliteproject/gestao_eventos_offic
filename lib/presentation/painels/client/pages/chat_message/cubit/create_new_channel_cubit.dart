import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestao_eventos/core/dependences/get_it.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

part 'create_new_channel_state.dart';

class CreateNewChannelCubit extends Cubit<CreateNewChannelState> {
  CreateNewChannelCubit() : super(CreateNewChannelInitial());

  Future<void> createNewChannel(String channelName) async {
    final client = getIt<StreamChatClient>();

    log(client.state.currentUser!.id);

    final chState = await client.createChannel(
      'messaging',
      channelId: const Uuid().v4(),
      channelData: {
        'name': channelName,
        'members': [
          client.state.currentUser!.id,
        ],
      },
    );

    if (chState.channel != null) {
      emit(CreateNewChanneSuccess(chState));
    } else {
      emit(const CreateNewChanneError('Falha ao criar canal'));
    }
  }
}
