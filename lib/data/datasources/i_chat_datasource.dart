import 'package:gestao_eventos/data/models/chat_message_model.dart';
import 'package:gestao_eventos/data/models/user_model.dart';

abstract class IChatDataSource {
  
  Future<bool> sendMessage(ChatMessageModel chatMessage);
  Future<List<ChatMessageModel>> getMessages(String senderEmail);  
  Future<List<UserModel>> getMessageSenders();  
}