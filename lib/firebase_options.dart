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
    apiKey: 'AIzaSyCKw_A1YKIcsIZB3ktIciegWGiIN55CTp8',
    appId: '1:27594988671:web:24e4f08a487d7913af334a',
    messagingSenderId: '27594988671',
    projectId: 'recomend-cooking',
    authDomain: 'recomend-cooking.firebaseapp.com',
    storageBucket: 'recomend-cooking.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA1Put-6z8xMha0sIRY1OvOKHBfA-pmp8o',
    appId: '1:27594988671:android:33674d2cd4a7d2fdaf334a',
    messagingSenderId: '27594988671',
    projectId: 'recomend-cooking',
    storageBucket: 'recomend-cooking.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD8pES4ZBmyPgNHTZIiNyVpamnIpLxEIuk',
    appId: '1:27594988671:ios:52efa69800ec9dcbaf334a',
    messagingSenderId: '27594988671',
    projectId: 'recomend-cooking',
    storageBucket: 'recomend-cooking.firebasestorage.app',
    iosBundleId: 'com.example.cookingReciept',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD8pES4ZBmyPgNHTZIiNyVpamnIpLxEIuk',
    appId: '1:27594988671:ios:52efa69800ec9dcbaf334a',
    messagingSenderId: '27594988671',
    projectId: 'recomend-cooking',
    storageBucket: 'recomend-cooking.firebasestorage.app',
    iosBundleId: 'com.example.cookingReciept',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCKw_A1YKIcsIZB3ktIciegWGiIN55CTp8',
    appId: '1:27594988671:web:00c4adc7669770caaf334a',
    messagingSenderId: '27594988671',
    projectId: 'recomend-cooking',
    authDomain: 'recomend-cooking.firebaseapp.com',
    storageBucket: 'recomend-cooking.firebasestorage.app',
  );
}