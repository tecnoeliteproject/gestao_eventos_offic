import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:gestao_eventos/data/datasources/remoto/firebase/chat_datasource.dart';
import 'package:gestao_eventos/data/repositories/chat_repository.dart';
import 'package:gestao_eventos/data/repositories/firebase_auth_repository.dart';
import 'package:gestao_eventos/domain/entities/chat_message.dart';
import 'package:gestao_eventos/domain/entities/user.dart';
import 'package:gestao_eventos/domain/usecases/auth_uc.dart';
import 'package:gestao_eventos/domain/usecases/chat_usecase.dart';
import 'package:gestao_eventos/domain/usecases_interfaces/i_chat_usercase.dart';

part 'admin_chat_message_event.dart';
part 'admin_chat_message_state.dart';

class AdminChatMessageBloc extends Bloc<AdminChatMessageEvent, AdminChatMessageState> {

  AdminChatMessageBloc(AdminMessageInitialState adminMessageInitialState) : super(GettingAdminMessagesState()) {
    initDependencies();
    initAllEvents();
  }

  void initAllEvents() {
    on<GetAdminMessagesEvent>((event, emit) async{
      emit(GettingAdminMessagesState());
      try {
        final result = await _usecase.getMessages(event.senderEmail);
        emit(GotAdminMessagesSucessState(messages: result));
      } catch (e) {
        emit(ErrorOnGetAdminMessagesState(message: 'Erro ao buscar mensagens'));
      }    
    });

    on<SendAdminMessageEvent>((event, emit) async{
      emit(SendingMessageState());
      try {
        final chatMessage = ChatMessage(message: event.message, dateTime: DateTime.now(),messageType: MessageType.receiver);
        final result = await _usecase.sendMessage(chatMessage);
        event.messages.add(chatMessage);
        event.messages.sort((a, b) => a.dateTime.compareTo(b.dateTime));
        emit(SentMessageSucessState(message: chatMessage, messages: event.messages));
      } catch (e) {
        emit(ErrorOnSendMessageState(message: 'Erro ao enviar mensagem'));
      }
    });

    on<GetAdminMessageSendersEvent>((event, emit) async{
      emit(GettingAdminMessageSendersState());
      try {
        final result = await _usecase.getMessageSenders();
        emit(GotMessageSendersState(users: result));
      } catch (e) {
        emit(ErrorOnSendMessageState(message: 'Erro ao buscar convesas'));
      }    
    });

    on<GotoChatEvent>((event, emit) async{
      emit(GotoChatState(user: event.user));
    });
  }

  void initDependencies() {
    _usecase = ChatUseCase(repository: ChatRepository(dataSource: ChatDataSource(firestore:FirebaseFirestore.instance)), authUC: AuthUC(repository: FirebaseAuthRepository()));
  }

  late IChatUsecase _usecase;
}
