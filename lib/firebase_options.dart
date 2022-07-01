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
    apiKey: 'AIzaSyBgK3Ov0EJXdmFIDod-RV_hRtm_nzWX54M',
    appId: '1:917119671987:web:c061776d12ba6ac8fbdac6',
    messagingSenderId: '917119671987',
    projectId: 'rack-stack',
    authDomain: 'rack-stack-4312e.firebaseapp.com',
    storageBucket: 'rack-stack.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC5CRDQjNqUQyp-KDDxXB7agHa-mdG-iFc',
    appId: '1:917119671987:android:eda9056f85050f8bfbdac6',
    messagingSenderId: '917119671987',
    projectId: 'rack-stack',
    storageBucket: 'rack-stack.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD0tepfQqpL-Is8pVjD5DWN5ZR2pVjBv3E',
    appId: '1:917119671987:ios:c34563338f4e5cb1fbdac6',
    messagingSenderId: '917119671987',
    projectId: 'rack-stack',
    storageBucket: 'rack-stack.appspot.com',
    iosClientId: '917119671987-23p3bkq0k47elhi1eq48kro12i33s6bm.apps.googleusercontent.com',
    iosBundleId: 'com.example.rackStack',
  );
}
