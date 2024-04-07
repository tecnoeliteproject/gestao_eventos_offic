
import 'package:gestao_eventos/domain/entities/chat_message.dart';
import 'package:gestao_eventos/domain/entities/user.dart';

abstract class IChatRepository {
  
  Future<bool> sendMessage(ChatMessage chatMessage);
  Future<List<ChatMessage>> getMessages(String senderEmail);  
  Future<List<ChatMessage>> getAllMessages();  
  Future<List<String>> getMessageIDSenders();
}