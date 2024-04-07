import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:gestao_eventos/core/helpers/generic_functions.dart';
import 'package:gestao_eventos/data/datasources/remoto/firebase/chat_datasource.dart';
import 'package:gestao_eventos/data/repositories/chat_repository.dart';
import 'package:gestao_eventos/data/repositories/firebase_auth_repository.dart';
import 'package:gestao_eventos/domain/entities/chat_message.dart';
import 'package:gestao_eventos/domain/entities/user.dart';
import 'package:gestao_eventos/domain/usecases/auth_uc.dart';
import 'package:gestao_eventos/domain/usecases/chat_usecase.dart';
import 'package:gestao_eventos/domain/usecases_interfaces/i_auth_uc.dart';
import 'package:gestao_eventos/domain/usecases_interfaces/i_chat_usercase.dart';

part 'channels_event.dart';
part 'channels_state.dart';

class ChannelsBloc extends Bloc<ChannelsEvent, ChannelsState> {
  ChannelsBloc(ChannelsInitialState channelsInitialState)
      : super(ChannelsInitialState()) {
    initDependencies();
    initAllEvents();
  }

  void initAllEvents() {
    on<GetChannelsEvent>((event, emit) async {
      emit(GettingChannelsState());
      try {
        final res = await _usecase.getHeadChannels();
        emit(GotChannelsState(chatMessage: res));
      } catch (e) {
        emit(ErrorOnGetChannelsState(messages: e.toString()));
      }
    });
  }

  void initDependencies() {
    _authUC = AuthUC(repository: FirebaseAuthRepository());
    _usecase = ChatUseCase(
      repository: ChatRepository(
          dataSource: ChatDataSource(firestore: FirebaseFirestore.instance)),
      authUC: _authUC,
    );
  }

  late IAuthUC _authUC;
  late IChatUsecase _usecase;
}
