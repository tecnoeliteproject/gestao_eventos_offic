import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestao_eventos/core/dependences/get_it.dart';
import 'package:gestao_eventos/domain/entities/user.dart' as lUser;
import 'package:gestao_eventos/domain/usecases_interfaces/i_auth_uc.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

part 'create_new_channel_state.dart';

class CreateNewChannelCubit extends Cubit<CreateNewChannelState> {
  CreateNewChannelCubit() : super(CreateNewChannelInitial()) {
    _authUC = getIt<IAuthUC>();
  }

  late final IAuthUC _authUC;

  Future<void> createNewChannel(String channelName) async {
    final client = getIt<StreamChatClient>();

    log(client.state.currentUser!.id);

    final users = await _authUC.getAllUsers();
    final admins = users
        .where((element) => element.level == lUser.User.ADMIN)
        .map((e) => e.id)
        .toList()
      ..remove(client.state.currentUser!.id);

    final chState = await client.createChannel(
      'messaging',
      channelId: const Uuid().v4(),
      channelData: {
        'name': channelName,
        'members': [
          client.state.currentUser!.id,
          ...admins,
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
