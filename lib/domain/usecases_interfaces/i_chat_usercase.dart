import 'package:gestao_eventos/domain/entities/chat_message.dart';

abstract class IChatUsecase {
  Future<bool> sendMessage(ChatMessage chatMessage);
  Future<List<ChatMessage>> getMessages(String senderEmail);  
  Future<List<ChatMessage>> getAllConversations();
}