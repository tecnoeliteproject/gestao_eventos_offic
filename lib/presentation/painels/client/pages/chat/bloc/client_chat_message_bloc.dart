import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:gestao_eventos/data/datasources/remoto/firebase/chat_datasource.dart';
import 'package:gestao_eventos/data/repositories/chat_repository.dart';
import 'package:gestao_eventos/data/repositories/firebase_auth_repository.dart';
import 'package:gestao_eventos/domain/entities/chat_message.dart';
import 'package:gestao_eventos/domain/usecases/auth_uc.dart';
import 'package:gestao_eventos/domain/usecases/chat_usecase.dart';
import 'package:gestao_eventos/domain/usecases_interfaces/i_auth_uc.dart';
import 'package:gestao_eventos/domain/usecases_interfaces/i_chat_usercase.dart';

part 'client_chat_message_event.dart';
part 'client_chat_message_state.dart';

class ClientChatMessageBloc extends Bloc<ClientChatMessageEvent, ClientChatMessageState> {

  ClientChatMessageBloc() : super(GettingClientMessagesState()) {
    initDependencies();
    initAllEvents();
  }

  void initAllEvents() {
    on<GetClientMessagesEvent>((event, emit) async{
      emit(GettingClientMessagesState());
      try {
        final result = await _usecase.getMessages((await _authUC.getCurrentUser())!.email!);
        emit(GotClientMessagesSucessState(messages: result));
      } catch (e) {
        emit(ErrorOnGetClientMessagesState(message: 'Erro ao buscar mensagens'));
      }    
    });

    on<SendMessageEvent>((event, emit) async{
      emit(SendingMessageState());
      try {
        ChatMessage chatMessage = ChatMessage(message: event.message, dateTime: DateTime.now(),messageType: MessageType.sender);
        await _usecase.sendMessage(chatMessage);
        event.messages.add(chatMessage);
        event.messages.sort((a, b) => a.dateTime.compareTo(b.dateTime));
        emit(SentMessageSucessState(message: chatMessage, messages: event.messages));
      } catch (e) {
        emit(ErrorOnSendMessageState(message: 'Erro ao enviar mensagem'));
      }
    });
  }

  void initDependencies() {
    _authUC = AuthUC(repository: FirebaseAuthRepository());
    _usecase = ChatUseCase(repository: ChatRepository(dataSource: ChatDataSource(firestore:FirebaseFirestore.instance)), authUC: _authUC);
  }

  late IAuthUC _authUC;
  late IChatUsecase _usecase;
}