class ChatMessage{
  ChatMessage({required this.dateTime, this.senderEmail, this.receiverEmail, required this.message, this.messageType});
  String message;
  MessageType? messageType;
  String? senderEmail;
  String? receiverEmail;
  DateTime dateTime;
}

enum MessageType{
  sender,
  receiver
}