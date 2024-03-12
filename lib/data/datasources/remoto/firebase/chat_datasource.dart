import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gestao_eventos/core/helpers/generic_functions.dart';
import 'package:gestao_eventos/data/datasources/i_chat_datasource.dart';
import 'package:gestao_eventos/data/models/chat_message_model.dart';
import 'package:gestao_eventos/data/models/user_model.dart';

class ChatDataSource extends IChatDataSource {
  ChatDataSource({required FirebaseFirestore firestore}) : _firestore = firestore;


  final String _collectionName = 'messages';
  final FirebaseFirestore _firestore;

  @override
  Future<List<ChatMessageModel>> getMessages(String senderEmail) async{
    final res = await _firestore.collection(_collectionName).doc(senderEmail).collection('client_messages').orderBy('date_time', descending: true).get();
    return res.docs.map((e) => ChatMessageModel.fromJson(e.data())).toList();
  }

  @override
  Future<bool> sendMessage(ChatMessageModel chatMessage)async {
    try {
      await _firestore.collection(_collectionName).doc(chatMessage.senderEmail).collection('client_messages').add(chatMessage.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<List<UserModel>> getMessageSenders() async{
    final res = await _firestore.collection('messages').get();
    showLog(messsage: res.size.toString());
    showLog(messsage: res.docs.length.toString());
    return _firestore.collection(_collectionName).get().then((value) {
      showLog(messsage: value.docs.toString());
      return value.docs.map((e) => UserModel.fromMap(e.data())).toList();
    });
  }
  
}