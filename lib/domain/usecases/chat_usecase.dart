import 'package:gestao_eventos/data/repositories_interfaces/i_chat_repository.dart';
import 'package:gestao_eventos/domain/entities/chat_message.dart';
import 'package:gestao_eventos/domain/entities/user.dart';
import 'package:gestao_eventos/domain/usecases_interfaces/i_auth_uc.dart';
import 'package:gestao_eventos/domain/usecases_interfaces/i_chat_usercase.dart';

class ChatUseCase extends IChatUsecase {
  ChatUseCase({required IChatRepository repository, required IAuthUC authUC})
      : _repository = repository,
        _iAuthUC = authUC;

  final IChatRepository _repository;
  final IAuthUC _iAuthUC;
  @override
  Future<List<ChatMessage>> getMessages(String senderEmail) async {
    final messages = await _repository.getMessages(senderEmail);
    messages.sort((a, b) => a.dateTime.compareTo(b.dateTime));
    return messages;
  }

  @override
  Future<bool> sendMessage(ChatMessage chatMessage) async {
    if (chatMessage.messageType == MessageType.sender) {
      chatMessage.senderEmail = (await _iAuthUC.getCurrentUser())!.email;
    } else {
      chatMessage.receiverEmail = (await _iAuthUC.getCurrentUser())!.email;
    }
    return _repository.sendMessage(chatMessage);
  }

  @override
  Future<List<User>> getMessageSenders() async {
    final list = <User>[];
    final messageSenders = await _repository.getMessageIDSenders();
    final allUsers = await _iAuthUC.getAllUsers();

    for (final element1 in messageSenders) {
      list.add(allUsers.firstWhere((element) => element.email == element1));
    }
    return list;
  }
}
