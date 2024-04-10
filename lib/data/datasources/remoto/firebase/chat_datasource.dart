import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gestao_eventos/data/datasources/i_chat_datasource.dart';
import 'package:gestao_eventos/data/models/chat_message_model.dart';
import 'package:uuid/uuid.dart';

class ChatDataSource extends IChatDataSource {
  ChatDataSource({required FirebaseFirestore firestore})
      : _firestore = firestore;

  final String _collectionName = 'messages';
  final FirebaseFirestore _firestore;

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
  Future<List<ChatMessageModel>> getAllConversations() async{
    final list = <ChatMessageModel>[];
    final res = await _firestore
        .collection(_collectionName)
        .orderBy('date_time', descending: true)
        .get();
    for (var element in res.docs) {
      var existe = list.any((element2) => element2.senderEmail == element['sender_email']);
      if (existe == false) {
        list.add(ChatMessageModel.fromJson(element.data()));
      }
    }
    return list;
  }
}
