import 'dart:typed_data';

import 'package:gestao_eventos/domain/entities/chat_message.dart';

class ChatMessageModel extends ChatMessage {
  ChatMessageModel(
      {required super.message,
      required super.dateTime,
      this.messageType,
      this.fileName,
      this.fileUrl,
      this.file,
      this.isFile,
      this.senderEmail,
      this.receiverEmail,});

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) {
    return ChatMessageModel(
      message: json['message'] as String,
      fileName: (json['file_name']??'') as String,
      fileUrl: (json['file_url']??'') as String,
      dateTime: DateTime.parse(json['date_time'] as String),
      messageType:
          json['message_type'] == 0 ? MessageType.sender : MessageType.receiver,
          isFile: json['is_file'] == 0 ? false : true,
      senderEmail: (json['sender_email']??'') as String,
      receiverEmail: (json['receiver_email']??'') as String,
    );
  }

  factory ChatMessageModel.fromEntity(ChatMessage chatMessage) {
    return ChatMessageModel(
      dateTime: chatMessage.dateTime,
        message: chatMessage.message,
        messageType: chatMessage.messageType,
        fileName: chatMessage.fileName,
        file: chatMessage.file,
        isFile: chatMessage.isFile,
        fileUrl: chatMessage.fileUrl,
        receiverEmail: chatMessage.receiverEmail,
        senderEmail: chatMessage.senderEmail,);
  }

  ChatMessage toEntity() {
    return ChatMessage(
        message: message,
        dateTime: dateTime,
        fileName: fileName,
        fileUrl: fileUrl,
        file: file,
        isFile: isFile,
        messageType: messageType,
        senderEmail: senderEmail,
        receiverEmail: receiverEmail,);
  }

  Map<String, dynamic> toMap(){
    return {
      'sender_email': senderEmail,
      'receiver_email': receiverEmail,
      'message': message,
      'file_name': fileName,
      'file_url': fileUrl,
      'is_file': isFile == 0 ? 0 : 1,
      'message_type': messageType == MessageType.sender ? 0 : 1,
      'date_time': dateTime.toIso8601String(),
    };
  }

  @override
  MessageType? messageType;
  @override
  String? senderEmail;
  @override
  String? receiverEmail;
  @override  
  String? fileName;
  @override
  String? fileUrl;
  @override
  bool? isFile;
  @override
  Uint8List? file;
}
