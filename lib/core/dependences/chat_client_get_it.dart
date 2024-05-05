import 'package:gestao_eventos/core/dependences/get_it.dart';
import 'package:gestao_eventos/core/helpers/constants.dart';
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
    'xzrky8h47aj6',
    logLevel: Level.INFO,
  );
  final user = getIt<entity.User>();

  await client.connectUser(
    User(
      id: user.id ?? user.name!.replaceAll(' ', ''),
      extraData: const {
        'image': 'https://getstream.io/random_png/'
            '?id=cool-shadow-7&amp;name=Cool+shadow',
      },
    ),
    streamChatClientToken,
    connectWebSocket: false,
  );
  print(client.state.currentUser?.id);
  return client;
}
