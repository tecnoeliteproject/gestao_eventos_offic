import 'package:gestao_eventos/data/repositories_interfaces/i_chat_repository.dart';
import 'package:gestao_eventos/domain/entities/chat_message.dart';
import 'package:gestao_eventos/domain/usecases_interfaces/i_auth_uc.dart';
import 'package:gestao_eventos/domain/usecases_interfaces/i_chat_usercase.dart';

class ChatUseCase extends IChatUsecase {
  ChatUseCase({required IChatRepository repository, required IAuthUC authUC}) : _repository = repository, _iAuthUC = authUC;

  final IChatRepository _repository;
  final IAuthUC _iAuthUC;

  @override
  Future<List<ChatMessage>> getMessages(String senderEmail) async{
    final messages = await _repository.getMessages(senderEmail);
    messages.sort((a, b) => a.dateTime.compareTo(b.dateTime));
    return messages;
  }

  @override
  Future<bool> sendMessage(ChatMessage chatMessage)async {
    return _repository.sendMessage(chatMessage);
  }
  
  @override
  Future<List<ChatMessage>> getAllConversations() async{
    List<ChatMessage> list = [];
    
    final res = await _repository.getAllConversations();
    for (final element in res) {
      var message = element.toEntity();
      message.sender = await _iAuthUC.getUserByEmail(message.senderEmail!);
      list.add(message);
    }
    return list;
  }
  
}