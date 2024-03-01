import 'package:gestao_eventos/data/models/chat_message_model.dart';

abstract class IChatDataSource {
  Future<bool> sendMessage(ChatMessageModel chatMessage);
  Future<List<ChatMessageModel>> getMessages();  

}