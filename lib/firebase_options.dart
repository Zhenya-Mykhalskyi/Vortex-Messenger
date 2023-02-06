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
        return macos;
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
    apiKey: 'AIzaSyAQcp3UtGwYQNkUWzZ3Cq_LdNe5RUooul8',
    appId: '1:446852363026:web:4e290af6ed1987d288b9cb',
    messagingSenderId: '446852363026',
    projectId: 'messenger-950c6',
    authDomain: 'messenger-950c6.firebaseapp.com',
    storageBucket: 'messenger-950c6.appspot.com',
    measurementId: 'G-95SRMN8HHW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB1jMxb4-3xjwUzpw49vOQqJfzyUfixnVE',
    appId: '1:446852363026:android:7efc582736fe824388b9cb',
    messagingSenderId: '446852363026',
    projectId: 'messenger-950c6',
    storageBucket: 'messenger-950c6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCJgejcvM4Z6jdpWNwUjEQfsYxBOSbkEko',
    appId: '1:446852363026:ios:c1541be9b2ba495288b9cb',
    messagingSenderId: '446852363026',
    projectId: 'messenger-950c6',
    storageBucket: 'messenger-950c6.appspot.com',
    iosClientId: '446852363026-c98skc07cphrcs4u7n1nl4sp0eg73hm9.apps.googleusercontent.com',
    iosBundleId: 'com.example.messenger',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCJgejcvM4Z6jdpWNwUjEQfsYxBOSbkEko',
    appId: '1:446852363026:ios:c1541be9b2ba495288b9cb',
    messagingSenderId: '446852363026',
    projectId: 'messenger-950c6',
    storageBucket: 'messenger-950c6.appspot.com',
    iosClientId: '446852363026-c98skc07cphrcs4u7n1nl4sp0eg73hm9.apps.googleusercontent.com',
    iosBundleId: 'com.example.messenger',
  );
}