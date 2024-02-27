class ChatMessage{
  ChatMessage({required this.messageContent, required this.messageType});
  String messageContent;
  MessageType messageType;
}

enum MessageType{
  seder,
  receiver
}