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
    apiKey: 'AIzaSyBOlsN2Gn0E1Qr0UBrnd65JCs9i1jlA5zs',
    appId: '1:135003324088:web:17627bf2e2ff332974fe4d',
    messagingSenderId: '135003324088',
    projectId: 'uasmobileprogramming-376c9',
    authDomain: 'uasmobileprogramming-376c9.firebaseapp.com',
    storageBucket: 'uasmobileprogramming-376c9.appspot.com',
    measurementId: 'G-B2RCL374VZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC3U0Y1bVVXC1f54dTXC2poLBVC27ndTqg',
    appId: '1:135003324088:android:b1c1519ea6892a4074fe4d',
    messagingSenderId: '135003324088',
    projectId: 'uasmobileprogramming-376c9',
    storageBucket: 'uasmobileprogramming-376c9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCKd0okwinsmIZQ9pR9_fFMi7mWtjG60rU',
    appId: '1:135003324088:ios:0d7c23ac51e9282e74fe4d',
    messagingSenderId: '135003324088',
    projectId: 'uasmobileprogramming-376c9',
    storageBucket: 'uasmobileprogramming-376c9.appspot.com',
    iosClientId: '135003324088-ruudcqsqbakatpgm5cd0rkgkt8oe1t7k.apps.googleusercontent.com',
    iosBundleId: 'com.example.duds',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCKd0okwinsmIZQ9pR9_fFMi7mWtjG60rU',
    appId: '1:135003324088:ios:484cdd85864bde1474fe4d',
    messagingSenderId: '135003324088',
    projectId: 'uasmobileprogramming-376c9',
    storageBucket: 'uasmobileprogramming-376c9.appspot.com',
    iosClientId: '135003324088-ubgvbhatskbf6b0u3rcljrl1qa8gtsfd.apps.googleusercontent.com',
    iosBundleId: 'com.example.duds.RunnerTests',
  );
}