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
    apiKey: 'AIzaSyBkjEgVfgiYCUW8qYzfD0U8Ksp0ychAibw',
    appId: '1:715323643964:web:3b361c797542dacf868b39',
    messagingSenderId: '715323643964',
    projectId: 'blood-donation-app-280db',
    authDomain: 'blood-donation-app-280db.firebaseapp.com',
    storageBucket: 'blood-donation-app-280db.appspot.com',
    measurementId: 'G-B4QCEG3X4K',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBUaBQY46j2JVoZKf-7VlUsMfDiCGrn2TA',
    appId: '1:715323643964:android:b64cce097cf85945868b39',
    messagingSenderId: '715323643964',
    projectId: 'blood-donation-app-280db',
    storageBucket: 'blood-donation-app-280db.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDa7BLhKChP-GYfbZwnAOxB4Ar3G8-gry8',
    appId: '1:715323643964:ios:bd73551a3ae691f0868b39',
    messagingSenderId: '715323643964',
    projectId: 'blood-donation-app-280db',
    storageBucket: 'blood-donation-app-280db.appspot.com',
    iosBundleId: 'com.example.bloodDonate',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDa7BLhKChP-GYfbZwnAOxB4Ar3G8-gry8',
    appId: '1:715323643964:ios:0acd5db25cbc630a868b39',
    messagingSenderId: '715323643964',
    projectId: 'blood-donation-app-280db',
    storageBucket: 'blood-donation-app-280db.appspot.com',
    iosBundleId: 'com.example.bloodDonate.RunnerTests',
  );
}