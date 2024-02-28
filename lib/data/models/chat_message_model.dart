import 'package:gestao_eventos/domain/entities/chat_message.dart';

class ChatMessageModel extends ChatMessage {
  ChatMessageModel(
      {required super.message,
      required super.dateTime,
      this.messageType,
      this.senderEmail,
      this.receiverEmail});

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) {
    return ChatMessageModel(
      message: json['message'] as String,
      dateTime: DateTime.parse(json['date_time'] as String),
      messageType:
          json['message_type'] == 0 ? MessageType.sender : MessageType.receiver,
      senderEmail: (json['sender_email']??'') as String,
      receiverEmail: (json['receiver_email']??'') as String,
    );
  }

  factory ChatMessageModel.fromEntity(ChatMessage chatMessage) {
    return ChatMessageModel(
      dateTime: chatMessage.dateTime,
        message: chatMessage.message,
        messageType: chatMessage.messageType,
        receiverEmail: chatMessage.receiverEmail,
        senderEmail: chatMessage.senderEmail);
  }

  ChatMessage toEntity() {
    return ChatMessage(
        message: message,
        dateTime: dateTime,
        messageType: messageType,
        senderEmail: senderEmail,
        receiverEmail: receiverEmail);
  }

  Map<String, dynamic> toMap(){
    return {
      'sender_email': senderEmail,
      'receiver_email': receiverEmail,
      'message': message,
      'message_type': messageType == MessageType.sender ? 0 : 1,
      'date_time': dateTime.toIso8601String()
    };
  }

  @override
  MessageType? messageType;
  @override
  String? senderEmail;
  @override
  String? receiverEmail;
}
