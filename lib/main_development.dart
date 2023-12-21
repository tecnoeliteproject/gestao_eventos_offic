import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:gestao_eventos/app/app.dart';
import 'package:gestao_eventos/bootstrap.dart';

import 'package:gestao_eventos/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  unawaited(bootstrap(() => const App()));
}
