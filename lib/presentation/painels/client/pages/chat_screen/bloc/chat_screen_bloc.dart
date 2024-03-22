import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'chat_screen_event.dart';
part 'chat_screen_state.dart';

class ClientChatScreenBloc extends Bloc<ChatScreenEvent, ChatScreenState> {
  ClientChatScreenBloc() : super(const ChatScreenInitial()) {
    on<CustomChatScreenEvent>(_onCustomChatScreenEvent);
  }

  FutureOr<void> _onCustomChatScreenEvent(
    CustomChatScreenEvent event,
    Emitter<ChatScreenState> emit,
  ) {
    // TODO: Add Logic
  }
}
