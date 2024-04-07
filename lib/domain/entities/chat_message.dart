import 'package:gestao_eventos/domain/entities/user.dart';

class ChatMessage{
  ChatMessage({required this.dateTime, this.senderEmail, this.receiverEmail, required this.message, this.messageType});
  String message;
  MessageType? messageType;
  String? senderEmail;
  String? receiverEmail;
  DateTime dateTime;
  User? sender, receiver;
}

enum MessageType{
  sender,
  receiver
}