import 'package:gestao_eventos/data/datasources/i_chat_datasource.dart';
import 'package:gestao_eventos/data/datasources/remoto/firebase/chat_datasource.dart';
import 'package:gestao_eventos/data/models/chat_message_model.dart';
import 'package:gestao_eventos/data/repositories_interfaces/i_chat_repository.dart';
import 'package:gestao_eventos/domain/entities/chat_message.dart';

class ChatRepository extends IChatRepository {
  ChatRepository({required IChatDataSource dataSource}) : _dataSource = dataSource;

  final IChatDataSource _dataSource;

  @override
  Future<List<ChatMessage>> getMessages() async {
    return (await _dataSource.getMessages()).map((e) => e.toEntity()).toList();
  }

  @override
  Future<bool> sendMessage(ChatMessage chatMessage) async {
    return _dataSource.sendMessage(ChatMessageModel.fromEntity(chatMessage));
  }
}
