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
    apiKey: 'AIzaSyAQHgaFBUEzq3OLLfUKYdV3_alhRMdpcRc',
    appId: '1:688384484982:web:0dab9c7a62cb7158c6e157',
    messagingSenderId: '688384484982',
    projectId: 'phulkuri',
    authDomain: 'phulkuri.firebaseapp.com',
    databaseURL: 'https://phulkuri-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'phulkuri.appspot.com',
    measurementId: 'G-PWW5KWWJT5',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAdpEzW_pX9u3nV-SSeE0nJYtJEdc8vWr8',
    appId: '1:688384484982:android:049247cca9b44227c6e157',
    messagingSenderId: '688384484982',
    projectId: 'phulkuri',
    databaseURL: 'https://phulkuri-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'phulkuri.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBe9GEPoPFJHhkz8WgllWULag_m9oWfyZY',
    appId: '1:688384484982:ios:73684a553d55f884c6e157',
    messagingSenderId: '688384484982',
    projectId: 'phulkuri',
    databaseURL: 'https://phulkuri-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'phulkuri.appspot.com',
    iosClientId: '688384484982-srcip6lo27v7amqvodcei9iqcodjhnpk.apps.googleusercontent.com',
    iosBundleId: 'com.example.phulkuri',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBe9GEPoPFJHhkz8WgllWULag_m9oWfyZY',
    appId: '1:688384484982:ios:d60394d0a91e761cc6e157',
    messagingSenderId: '688384484982',
    projectId: 'phulkuri',
    databaseURL: 'https://phulkuri-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'phulkuri.appspot.com',
    iosClientId: '688384484982-1fcgqirursmuj0ugcue6m7khk5mihncc.apps.googleusercontent.com',
    iosBundleId: 'com.example.phulkuri.RunnerTests',
  );
}
