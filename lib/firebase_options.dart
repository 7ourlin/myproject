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
        return ios;
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
    apiKey: 'AIzaSyBUte9NCZIt8UDtLp1iLe9hr-9a1Ayh1AQ',
    appId: '1:1048841997076:web:067bb2e4b3098cdce0d001',
    messagingSenderId: '1048841997076',
    projectId: 'constructour-92fa3',
    authDomain: 'constructour-92fa3.firebaseapp.com',
    storageBucket: 'constructour-92fa3.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBCLmJ8cSf0GD4PFQJGfIMOCA0cVJRrBNo',
    appId: '1:1048841997076:android:14e5fde4c24986d8e0d001',
    messagingSenderId: '1048841997076',
    projectId: 'constructour-92fa3',
    storageBucket: 'constructour-92fa3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD0BXqmmN9fzocbEloAkzeivX4JmP2J8WE',
    appId: '1:1048841997076:ios:21f1803445e78f9fe0d001',
    messagingSenderId: '1048841997076',
    projectId: 'constructour-92fa3',
    storageBucket: 'constructour-92fa3.appspot.com',
    iosClientId: '1048841997076-abh9jics1a6i7bb9a617aee6m9g4mqgd.apps.googleusercontent.com',
    iosBundleId: 'com.example.myproject',
  );
}