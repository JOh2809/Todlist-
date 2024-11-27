// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyBbdIsU9oqDQZzLVlrpgzcDrsNFEfdloJ0',
    appId: '1:882451105966:web:e97a71cf77784c6891853f',
    messagingSenderId: '882451105966',
    projectId: 'todolist-534b7',
    authDomain: 'todolist-534b7.firebaseapp.com',
    storageBucket: 'todolist-534b7.firebasestorage.app',
    measurementId: 'G-6SS5LJ1WWT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAAJxKhoychWngWdu5sKhnMUaA_TDR2kAI',
    appId: '1:882451105966:android:0ce18450390eaa0e91853f',
    messagingSenderId: '882451105966',
    projectId: 'todolist-534b7',
    storageBucket: 'todolist-534b7.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDvPbUWqHcwq1FrgiBwf0Yku2_JaqZy08k',
    appId: '1:882451105966:ios:a2e5d5607492d48c91853f',
    messagingSenderId: '882451105966',
    projectId: 'todolist-534b7',
    storageBucket: 'todolist-534b7.firebasestorage.app',
    iosBundleId: 'com.example.todolist',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDvPbUWqHcwq1FrgiBwf0Yku2_JaqZy08k',
    appId: '1:882451105966:ios:a2e5d5607492d48c91853f',
    messagingSenderId: '882451105966',
    projectId: 'todolist-534b7',
    storageBucket: 'todolist-534b7.firebasestorage.app',
    iosBundleId: 'com.example.todolist',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBbdIsU9oqDQZzLVlrpgzcDrsNFEfdloJ0',
    appId: '1:882451105966:web:7ccdd41f57edf77791853f',
    messagingSenderId: '882451105966',
    projectId: 'todolist-534b7',
    authDomain: 'todolist-534b7.firebaseapp.com',
    storageBucket: 'todolist-534b7.firebasestorage.app',
    measurementId: 'G-Y5QMJGT3B7',
  );
}
