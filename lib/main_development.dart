<<<<<<< HEAD
import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:gestao_eventos/bootstrap.dart';
import 'package:gestao_eventos/firebase_options.dart';
import 'package:gestao_eventos/presentation/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  unawaited(bootstrap(() => const App()));
}
=======
import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:gestao_eventos/bootstrap.dart';
import 'package:gestao_eventos/firebase_options.dart';
import 'package:gestao_eventos/presentation/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  unawaited(bootstrap(() => const App()));
}
>>>>>>> 9c1fb90644301fea5aadcc0ac7058a394f50e020
