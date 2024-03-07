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
    apiKey: 'AIzaSyAg9GYTZIadWD3-mOYLtydXtBLOCEZpIKo',
    appId: '1:153145527969:web:465bb56cb819e443c7aae0',
    messagingSenderId: '153145527969',
    projectId: 'shareplate-innoventors',
    authDomain: 'shareplate-innoventors.firebaseapp.com',
    storageBucket: 'shareplate-innoventors.appspot.com',
    measurementId: 'G-WD26B7D360',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDadQ1OAMATi7wsCO9_VnsBpwG0_0fNlyM',
    appId: '1:153145527969:android:cea95d10a25a2187c7aae0',
    messagingSenderId: '153145527969',
    projectId: 'shareplate-innoventors',
    storageBucket: 'shareplate-innoventors.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBIyCy_O7cnBbcLlAV2GTSTUjs-qK16wCI',
    appId: '1:153145527969:ios:82276e8954eaf16bc7aae0',
    messagingSenderId: '153145527969',
    projectId: 'shareplate-innoventors',
    storageBucket: 'shareplate-innoventors.appspot.com',
    iosClientId: '153145527969-5tgjopmlf3cq5520envrf5rf5vdeloni.apps.googleusercontent.com',
    iosBundleId: 'com.example.shareplateFlutter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBIyCy_O7cnBbcLlAV2GTSTUjs-qK16wCI',
    appId: '1:153145527969:ios:9c568e2dfbfbc443c7aae0',
    messagingSenderId: '153145527969',
    projectId: 'shareplate-innoventors',
    storageBucket: 'shareplate-innoventors.appspot.com',
    iosClientId: '153145527969-v6dq2ucejmsk3vlonb57vb5ia06islt1.apps.googleusercontent.com',
    iosBundleId: 'com.example.shareplateFlutter.RunnerTests',
  );
}
