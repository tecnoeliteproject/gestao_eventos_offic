import 'dart:typed_data';

import 'package:gestao_eventos/domain/entities/user.dart';

class ChatMessage {
  ChatMessage(
      {required this.dateTime,
      this.senderEmail,
      this.receiverEmail,
      this.fileName,
      this.fileUrl,
      this.file,
      this.isFile,
      required this.message,
      this.messageType});
  String message;
  String? fileName;
  String? fileUrl;
  bool? isFile;
  MessageType? messageType;
  String? senderEmail;
  String? receiverEmail;
  DateTime dateTime;
  Uint8List? file;

  User? sender;

}

enum MessageType { sender, receiver }
