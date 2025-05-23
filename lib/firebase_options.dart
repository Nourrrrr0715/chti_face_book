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
    apiKey: 'AIzaSyABJXwoXZtbx3-11TGxn7rhPoIXsfm9o9w',
    appId: '1:736465277793:web:0037a851efa8a494ac6b20',
    messagingSenderId: '736465277793',
    projectId: 'chti-face-bouc-ddd92',
    authDomain: 'chti-face-bouc-ddd92.firebaseapp.com',
    storageBucket: 'chti-face-bouc-ddd92.firebasestorage.app',
    measurementId: 'G-00DV9MMQC6',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyACFGpr9NlEA4BB8r9lsfkomPCbfQkYP5c',
    appId: '1:736465277793:android:177c7f8e2c647e75ac6b20',
    messagingSenderId: '736465277793',
    projectId: 'chti-face-bouc-ddd92',
    storageBucket: 'chti-face-bouc-ddd92.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDFHBRu6ZQCo5Gfwg-dgtsq9wOEuNw8WeI',
    appId: '1:736465277793:ios:69396d1a52025586ac6b20',
    messagingSenderId: '736465277793',
    projectId: 'chti-face-bouc-ddd92',
    storageBucket: 'chti-face-bouc-ddd92.firebasestorage.app',
    iosBundleId: 'com.example.chtiFaceBouc',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDFHBRu6ZQCo5Gfwg-dgtsq9wOEuNw8WeI',
    appId: '1:736465277793:ios:69396d1a52025586ac6b20',
    messagingSenderId: '736465277793',
    projectId: 'chti-face-bouc-ddd92',
    storageBucket: 'chti-face-bouc-ddd92.firebasestorage.app',
    iosBundleId: 'com.example.chtiFaceBouc',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyABJXwoXZtbx3-11TGxn7rhPoIXsfm9o9w',
    appId: '1:736465277793:web:3934cd705a38d8aeac6b20',
    messagingSenderId: '736465277793',
    projectId: 'chti-face-bouc-ddd92',
    authDomain: 'chti-face-bouc-ddd92.firebaseapp.com',
    storageBucket: 'chti-face-bouc-ddd92.firebasestorage.app',
    measurementId: 'G-RYDF8PCRE1',
  );
}
