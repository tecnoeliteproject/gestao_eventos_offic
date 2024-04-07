import 'package:gestao_eventos/data/models/chat_message_model.dart';
import 'package:gestao_eventos/domain/entities/chat_message.dart';

abstract class IChatDataSource {
  
  Future<bool> sendMessage(ChatMessageModel chatMessage);
  Future<List<ChatMessageModel>> getMessages(String senderEmail);  
  Future<List<String>> getMessageIDSenders();

  Future<List<ChatMessageModel>> getAllMessages();
}