import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gestao_eventos/data/datasources/i_chat_datasource.dart';
import 'package:gestao_eventos/data/models/chat_message_model.dart';

class ChatDataSource extends IChatDataSource {
  ChatDataSource({required FirebaseFirestore firestore}) : _firestore = firestore;


  final String _collectionName = 'messages';
  final FirebaseFirestore _firestore;

  @override
  Future<List<ChatMessageModel>> getMessages() {
    return _firestore.collection( _collectionName).get().then((value) {
      return value.docs.map((e) => ChatMessageModel.fromJson(e.data())).toList();
    });
  }

  @override
  Future<bool> sendMessage(ChatMessageModel chatMessage)async {
    try {
      await _firestore
          .collection(_collectionName)
          .add(chatMessage.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }
  
}