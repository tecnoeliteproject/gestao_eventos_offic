import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:gestao_eventos/core/dependences/get_it.dart';
import 'package:gestao_eventos/core/helpers/generic_functions.dart';
import 'package:gestao_eventos/data/datasources/i_chat_datasource.dart';
import 'package:gestao_eventos/data/models/chat_message_model.dart';
import 'package:uuid/uuid.dart';

class ChatDataSource extends IChatDataSource {
  ChatDataSource({required FirebaseFirestore firestore})
      : _firestore = firestore;

  final String _collectionName = 'messages';
  final FirebaseFirestore _firestore;

  static String _pdfStorageBucket = '/pdfs';

  @override
  Future<List<ChatMessageModel>> getMessages(String senderEmail) async {
    final res = await _firestore
        .collection(_collectionName)
        .orderBy('date_time', descending: true)
        .where('sender_email', isEqualTo: senderEmail)
        .get();
    return res.docs.map((e) => ChatMessageModel.fromJson(e.data())).toList();
  }

  @override
  Future<List<String>> getMessageIDSenders() async {
    final res = await _firestore.collection('messages').get();
    return res.docs.map((e) => e.data()['sender_email'] as String).toList();
  }

  @override
  Future<bool> sendMessage(ChatMessageModel chatMessage) async {
    if (chatMessage.isFile == true) {
      final res = await sendFileMessage(chatMessage);
      return true;
    }
    try {
      await _firestore
          .collection(_collectionName)
          .doc(const Uuid().v4())
          .set(chatMessage.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<ChatMessageModel?> sendFileMessage(ChatMessageModel chatMessage) async {
    try {
      showLog(messsage: 'messsage: ${chatMessage.fileUrl}');
      chatMessage.fileUrl =
          await savePdfFile(chatMessage.file!, chatMessage.fileName!);
      showLog(messsage: 'messsage: ${chatMessage.fileUrl}');
          await _firestore
          .collection(_collectionName)
          .doc(const Uuid().v4())
          .set(chatMessage.toMap());
      return chatMessage;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<ChatMessageModel>> getAllConversations() async {
    final list = <ChatMessageModel>[];
    final res = await _firestore
        .collection(_collectionName)
        .orderBy('date_time', descending: true)
        .get();
    for (var element in res.docs) {
      var existe = list
          .any((element2) => element2.senderEmail == element['sender_email']);
      if (existe == false) {
        list.add(ChatMessageModel.fromJson(element.data()));
      }
    }
    return list;
  }

  Future<String> savePdfFile(Uint8List asset, String name) async {
    FirebaseStorage _storage = FirebaseStorage.instance;
    final ref = _storage
        .ref();
    final res = await ref.child('$_pdfStorageBucket/pdf_${DateTime.now().toIso8601String()}_.pdf').putData(asset);

    return 'res.ref.getDownloadURL()';
  }
}
