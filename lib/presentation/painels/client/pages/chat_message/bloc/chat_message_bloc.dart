import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestao_eventos/core/dependences/get_it.dart';
import 'package:gestao_eventos/core/helpers/constants.dart';
import 'package:gestao_eventos/domain/entities/user.dart' as localUser;
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

part 'chat_message_event.dart';
part 'chat_message_state.dart';

class ChatMessageBloc extends Bloc<ChatMessageEvent, ChatMessageState> {
  ChatMessageBloc() : super(const ChatMessageInitial()) {
    on<CustomChatMessageEvent>(_onCustomChatMessageEvent);
  }

  FutureOr<void> _onCustomChatMessageEvent(
    CustomChatMessageEvent event,
    Emitter<ChatMessageState> emit,
  ) async {
    emit(const ChatMessageLoading());
    final user = getIt<localUser.User>();
    final client = getIt<StreamChatClient>();
    await client.connectUser(
      User(id: user.id!),
      streamChatClientToken,
    );
    emit(const ChatMessageSuccess());
  }
}
