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
    apiKey: 'AIzaSyBJKjiIFE9ZczR1VsS1g9DG8hgipwZpkhk',
    appId: '1:75391372358:web:5d470b578e6c00fe8d4e47',
    messagingSenderId: '75391372358',
    projectId: 'taskcraft-417310',
    authDomain: 'taskcraft-417310.firebaseapp.com',
    storageBucket: 'taskcraft-417310.appspot.com',
    measurementId: 'G-3E9TYY2RR2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAsbsnyNVWFuCkmeQXbVE4uaxXMmXF_910',
    appId: '1:75391372358:android:07e9f60d68efc8a28d4e47',
    messagingSenderId: '75391372358',
    projectId: 'taskcraft-417310',
    storageBucket: 'taskcraft-417310.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD6qn9Grn-tmznSx2RefRzDdoVT8yxtcFk',
    appId: '1:75391372358:ios:63ddf3e8210001fd8d4e47',
    messagingSenderId: '75391372358',
    projectId: 'taskcraft-417310',
    storageBucket: 'taskcraft-417310.appspot.com',
    iosClientId: '75391372358-tckqqbl8djdkv8rbf0k02hvh1of9tvdd.apps.googleusercontent.com',
    iosBundleId: 'info.ishaf.taskcraft',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD6qn9Grn-tmznSx2RefRzDdoVT8yxtcFk',
    appId: '1:75391372358:ios:537030fe60d840f78d4e47',
    messagingSenderId: '75391372358',
    projectId: 'taskcraft-417310',
    storageBucket: 'taskcraft-417310.appspot.com',
    iosClientId: '75391372358-bjn7e4eh0ve9p9l2m8cvh3fqrac4vas0.apps.googleusercontent.com',
    iosBundleId: 'com.example.sampleProject',
  );
}