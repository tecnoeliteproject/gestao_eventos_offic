// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAV7dco64MdqOjyFR5Y2gBvZAEXOuRNGqk',
    appId: '1:290981595970:web:0f9ed5858fdc336086d6db',
    messagingSenderId: '290981595970',
    projectId: 'gestao-eventoss',
    authDomain: 'gestao-eventoss.firebaseapp.com',
    storageBucket: 'gestao-eventoss.appspot.com',
    measurementId: 'G-V9JRYYK3RG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCKYN_SQ7wKdX46r2Ptdp7YTJNTWnYJ32s',
    appId: '1:290981595970:android:84110e1411ca678586d6db',
    messagingSenderId: '290981595970',
    projectId: 'gestao-eventoss',
    storageBucket: 'gestao-eventoss.appspot.com',
  );
}
