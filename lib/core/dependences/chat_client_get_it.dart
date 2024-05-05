import 'package:gestao_eventos/core/dependences/get_it.dart';
import 'package:gestao_eventos/domain/entities/user.dart' as entity;
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

Future<void> setupChatClientGetIt() async {
  final client = await _createChatClient();
  getIt.registerLazySingleton<StreamChatClient>(() {
    return client;
  });
}

Future<StreamChatClient> _createChatClient() async {
  final client = StreamChatClient(
    'vtp8f5kugtt4',
    connectTimeout: const Duration(seconds: 10),
  );
  final user = getIt<entity.User>();

  await client.connectUser(
    User(
      id: _getUserId(user),
      name: user.name ?? 'Guest',
      role: user.level == 0 ? 'admin' : 'user',
    ),
    client.devToken(_getUserId(user)).rawValue,
  );

  return client;
}

String _getUserId(entity.User user) =>
    user.id ?? user.name!.replaceAll(' ', '');
