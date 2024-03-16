import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:gestao_eventos/bootstrap.dart';
import 'package:gestao_eventos/core/dependences/get_it.dart';
import 'package:gestao_eventos/firebase_options.dart';
import 'package:gestao_eventos/presentation/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // configura o firebase emulators,
  // Host: ip da maquina rodando "firebase emulators:start" - configuravel
  if (kDebugMode) {
    // await _configureFirebaseEmulators();
  }

  await setupGetIt();

  unawaited(bootstrap(() => const App()));
}

Future<void> _configureFirebaseEmulators() async {
  try {
    FirebaseFirestore.instance.useFirestoreEmulator('192.168.8.170', 8089);
    await FirebaseStorage.instance.useStorageEmulator('192.168.8.170', 9199);
    await FirebaseAuth.instance.useAuthEmulator('192.168.8.170', 9099);
  } catch (e) {
    print(e);
  }
}
