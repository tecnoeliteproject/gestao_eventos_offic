import 'dart:async';

import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:gestao_eventos/bootstrap.dart';
import 'package:gestao_eventos/core/dependences/get_it.dart';
import 'package:gestao_eventos/firebase_options.dart';
import 'package:gestao_eventos/presentation/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
<<<<<<< HEAD

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
=======
  
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
>>>>>>> bc298f7 (adiciona a tela de tipos arquivados)

  await setupGetIt();

  if (kIsWeb) {
    unawaited(bootstrap(() => DevicePreview(builder: (c) => const App())));
  } else {
    unawaited(bootstrap(() => const App()));
  }
}
