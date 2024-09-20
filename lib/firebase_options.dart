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
    apiKey: 'AIzaSyCWL9BdaUIm_fbZIWgtGefJ4JENVyhf2T8',
    appId: '1:762798075233:web:202524a5003d3365aca920',
    messagingSenderId: '762798075233',
    projectId: 'global-med-1fef1',
    authDomain: 'global-med-1fef1.firebaseapp.com',
    storageBucket: 'global-med-1fef1.appspot.com',
    measurementId: 'G-6R05V1GTXZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAy0P15fcFzm7EyYkK_-6f3obejhhOrqY4',
    appId: '1:762798075233:android:db1e0ed296853e26aca920',
    messagingSenderId: '762798075233',
    projectId: 'global-med-1fef1',
    storageBucket: 'global-med-1fef1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyADZCpIMyM9DjAszgbja16b53HNGVutp_E',
    appId: '1:762798075233:ios:35e829b3eeb733daaca920',
    messagingSenderId: '762798075233',
    projectId: 'global-med-1fef1',
    storageBucket: 'global-med-1fef1.appspot.com',
    iosBundleId: 'com.example.globalMed',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyADZCpIMyM9DjAszgbja16b53HNGVutp_E',
    appId: '1:762798075233:ios:35e829b3eeb733daaca920',
    messagingSenderId: '762798075233',
    projectId: 'global-med-1fef1',
    storageBucket: 'global-med-1fef1.appspot.com',
    iosBundleId: 'com.example.globalMed',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCWL9BdaUIm_fbZIWgtGefJ4JENVyhf2T8',
    appId: '1:762798075233:web:296676f45bb366ceaca920',
    messagingSenderId: '762798075233',
    projectId: 'global-med-1fef1',
    authDomain: 'global-med-1fef1.firebaseapp.com',
    storageBucket: 'global-med-1fef1.appspot.com',
    measurementId: 'G-32926YS9LZ',
  );
}
